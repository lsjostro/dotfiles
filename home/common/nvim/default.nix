{
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./treesitter.nix
  ];

  programs.man.generateCaches = false;

  programs.neovim = {
    enable = true;
    # package = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    withNodeJs = false;
    withPython3 = false;
    withRuby = false;

    extraLuaConfig = lib.fileContents ./init.lua;

    extraPackages = with pkgs; [
      codeium
      harper
      lua-language-server
      nixd
      shellcheck
      shfmt
      stylua
      yaml-language-server
    ];

    plugins = with pkgs.vimPlugins; [
      friendly-snippets
      go-nvim
      targets-vim
      ts-comments-nvim

      {
        plugin = pkgs.vimUtils.buildVimPlugin {
          name = "neocodeium";
          src = pkgs.fetchFromGitHub {
            owner = "monkoose";
            repo = "neocodeium";
            rev = "4da81528468b33585c411f31eb390dce573ccb14"; # v1.8.0
            hash = "sha256-1n9nNqBNwNDSzbAkm8eB4HZLNy5HmMg25jPwQAnW5OU=";
          };
          doCheck = false;
        };
        type = "lua";
        config = ''
          local neocodeium =require('neocodeium')
          neocodeium.setup {
            root_dir = { ".bzr", ".jj", ".git", ".hg", ".svn", "_FOSSIL_", "package.json" }
          }
          vim.keymap.set("i", "<C-j>", neocodeium.accept, { remap = true })
          vim.keymap.set("i", "<A-f>", neocodeium.accept, { remap = true })
          vim.keymap.set("i", "<C-h>", neocodeium.cycle_or_complete, { remap = true })
        '';
      }

      {
        plugin = pkgs.vimUtils.buildVimPlugin {
          name = "direnv-nvim";
          src = pkgs.fetchFromGitHub {
            owner = "actionshrimp";
            repo = "direnv.nvim";
            rev = "main";
            hash = "sha256-7NcVskgAurbIuEVIXxHvXZfYQBOEXLURGzllfVEQKNE=";
          };
        };
        type = "lua";
        config = ''
          require('direnv-nvim').setup {
            type = "dir"
          }
        '';
      }

      {
        plugin = nvim-lspconfig;
        type = "lua";
        config = lib.fileContents ./lsp.lua;
      }

      {
        plugin = blink-cmp;
        type = "lua";
        config = lib.fileContents ./blink-cmp.lua;
      }

      {
        plugin = pkgs.vimUtils.buildVimPlugin {
          name = "blink.compat";
          src = pkgs.fetchFromGitHub {
            owner = "saghen";
            repo = "blink.compat";
            rev = "78f3f7187ff4a1444e952548c556d936da8f72fc"; # v2.1.2
            hash = "sha256-aqHDwrzPOyOw9UbJlQX10/cVQwNHg4v6i9jSm+pNKZc=";
          };
        };
        type = "lua";
        config = ''
          require('blink.compat').setup()
        '';
      }

      {
        plugin = pkgs.vimUtils.buildVimPlugin {
          name = "inlay-hints";
          src = pkgs.fetchFromGitHub {
            owner = "MysticalDevil";
            repo = "inlay-hints.nvim";
            rev = "3259b54f3b954b4d8260f3ee49ceabe978ea5636";
            hash = "sha256-99KCGoPowa4PA1jkCm4ZbbgrFl84NWnKQMgkfy8KS5E=";
          };
        };
        type = "lua";
        config = ''
          require('inlay-hints').setup {
            autocmd = { enable = false },
          }
        '';
      }

      {
        plugin = pkgs.vimUtils.buildVimPlugin {
          name = "conform";
          src = pkgs.fetchFromGitHub {
            owner = "stevearc";
            repo = "conform.nvim";
            rev = "80b57f662b5e13ae8c2c7c38639966084625fa5e";
            hash = "sha256-zC1WZFS+ZA1+BM36VnVkVE+/ovXdWCzL9kDIP3q9rIk=";
          };
        };
        type = "lua";
        config = ''
          require('conform').setup {
            formatters_by_ft = {
              ["cue"] = { { "cue_fmt" } },
              ["html"] = { { "prettierd", "prettier" } },
              ["sass"] = { { "prettierd", "prettier" } },
              ["proto"] = { { "buf" } },
              ["terraform"] = { { "terraform_fmt" } },
            }
          }
        '';
      }

      {
        plugin = pkgs.vimUtils.buildVimPlugin {
          name = "dieter-nvim";
          src = ./dieter;
        };
        type = "lua";
        config = ''
          vim.cmd.colorscheme "dieter"
        '';
      }

      {
        plugin = mini-nvim;
        type = "lua";
        config = lib.fileContents ./mini.lua;
      }

      {
        plugin = rustaceanvim;
        type = "lua";
        config = lib.fileContents ./rust.lua;
      }
    ];
  };
}
