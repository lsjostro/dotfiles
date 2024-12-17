{
  inputs,
  lib,
  pkgs,
  ...
}:
{
  programs.neovim = {
    extraPackages = with pkgs; [
      tree-sitter
    ];

    plugins = with pkgs.vimPlugins; [
      ts-comments-nvim
      nvim-ts-context-commentstring
      playground

      {
        plugin = nvim-treesitter-context;
        type = "lua";
        config = ''
          require'treesitter-context'.setup{
            enable = false,
          }
          vim.keymap.set('n', '<space>ut', "<cmd>TSContextToggle<cr>", {noremap = true, silent = true, desc = "TS Context"})
        '';
      }

      {
        plugin = nvim-treesitter.withAllGrammars;
        type = "lua";
        config = ''
          require'nvim-treesitter.configs'.setup {
            highlight = { enable = true, },
            indent = { enable = true },
            rainbow = { enable = true },
            textobjects = {
              select = {
                enable = true,
                lookahead = true,
              },
            },
          }
        '';
      }

      {
        plugin = pkgs.vimUtils.buildVimPlugin {
          name = "nvim-tree-pairs"; # make % match in TS
          src = pkgs.fetchFromGitHub {
            owner = "yorickpeterse";
            repo = "nvim-tree-pairs";
            rev = "e7f7b6cc28dda6f3fa271ce63b0d371d5b7641da";
            hash = "sha256-fb4EsrWAbm8+dWAhiirCPuR44MEg+KYb9hZOIuEuT24=";
          };
        };
        type = "lua";
        config = "require('tree-pairs').setup()";
      }

      {
        plugin = nvim-treesitter-textobjects;
        type = "lua";
        config = ''
          require'nvim-treesitter.configs'.setup {
            incremental_selection = {
              enable = true,
              keymaps = {
                init_selection = "<M-o>",
                scope_incremental = "<M-O>",
                node_incremental = "<M-o>",
                node_decremental = "<M-i>",
              },
            },
          }
        '';
      }
    ];
  };
}
