{
  inputs,
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
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    withNodeJs = false;
    withPython3 = false;
    withRuby = false;

    extraLuaConfig = lib.fileContents ./init.lua;

    extraPackages = with pkgs; [
      black
      codeium
      cue
      go
      gopls
      gotools
      harper
      lua-language-server
      nil
      nixd
      nodePackages.prettier
      nodePackages.typescript
      nodePackages.typescript-language-server
      nodePackages.bash-language-server
      rust-analyzer
      rustfmt
      shellcheck
      shfmt
      stylua
      superhtml
      vscode-langservers-extracted
    ];

    plugins = with pkgs.vimPlugins; [
      direnv-vim
      friendly-snippets
      go-nvim
      targets-vim
      ts-comments-nvim

      {
        plugin = nvim-lspconfig;
        type = "lua";
        config = lib.fileContents ./lsp.lua;
      }

      {
        plugin = blink-cmp;
        type = "lua";
        config = ''
          require'blink-cmp'.setup({
            keymap = {
              preset = 'enter',
              ["<PageDown>"] = { "scroll_documentation_down" },
              ["<PageUp>"] = { "scroll_documentation_up" },
            },
            completion = {
              accept = {
                auto_brackets = {
                  enabled = true,
                },
              },

              documentation = {
                auto_show = true,
                auto_show_delay_ms = 800,
                window = {
                  border = 'rounded',
                },
                ghost_text = {
                  enabled = true,
                },
              },

              signature = {
                enabled = true,
                window = {
                  border = 'rounded',
                },
              },

            },
          })
        '';
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
            rev = "af84dee42cd118af6d592b06c1c0e45d6432a6c0"; # 2024-08-23
            hash = "sha256-DZVtFAUK9c8GInp+JdCQ1BKe0dkAheHKI67oxdMmA24=";
          };
        };
        type = "lua";
        config = ''
          require('inlay-hints').setup()
          require("inlay-hints.utils").enable_inlay_hints()
        '';
      }

      {
        plugin = codeium-nvim;
        type = "lua";
        config = ''
          require'codeium'.setup {
            enable_chat = false,
          }
        '';
      }

      {
        plugin = pkgs.vimUtils.buildVimPlugin {
          name = "neocodeium";
          src = pkgs.fetchFromGitHub {
            owner = "monkoose";
            repo = "neocodeium";
            rev = "4da81528468b33585c411f31eb390dce573ccb14"; # v1.8.0
            hash = "sha256-1n9nNqBNwNDSzbAkm8eB4HZLNy5HmMg25jPwQAnW5OU=";
          };
        };
        type = "lua";
        config = ''
          local neocodeium =require('neocodeium')
          neocodeium.setup()
          vim.keymap.set("i", "<C-j>", neocodeium.accept, { remap = true })
          vim.keymap.set("i", "<A-f>", neocodeium.accept, { remap = true })
          vim.keymap.set("i", "<C-h>", neocodeium.cycle_or_complete, { remap = true })
        '';
      }

      {
        plugin = pkgs.vimUtils.buildVimPlugin {
          name = "diagflow";
          src = pkgs.fetchFromGitHub {
            owner = "dgagn";
            repo = "diagflow.nvim";
            rev = "fc09d55d2e60edc8ed8f9939ba97b7b7e6488c99";
            hash = "sha256-2WNuaIEXcAgUl2Kb/cCHEOrtehw9alaoM96qb4MLArw=";
          };
        };
        type = "lua";
        config = ''
          require('diagflow').setup {
            scope = "line",
            gap_size = 0,
            max_width = 50,
            max_height = 20,
            show_borders = true,
            toggle_event = { "InsertEnter", "InsertLeave" },
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
