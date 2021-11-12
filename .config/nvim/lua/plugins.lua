return require('packer').startup(function()
  use 'hashivim/vim-terraform'
  use 'pierreglaser/folding-nvim'
  use 'tjdevries/colorbuddy.vim'
  use 'wbthomason/packer.nvim'
	use 'ray-x/lsp_signature.nvim'
	use 'jose-elias-alvarez/nvim-lsp-ts-utils'
	use 'github/copilot.vim'

  use {
	  'b3nj5m1n/kommentary',
	  config = function()
		  require('kommentary.config').use_extended_mappings()
		  vim.api.nvim_set_keymap("n", "", "<Plug>kommentary_line_default", {}) -- C-/
		  vim.api.nvim_set_keymap("v", "", "<Plug>kommentary_visual_default", {}) -- C-/

			require('kommentary.config').configure_language("default", {
				prefer_single_line_comments = true,
			})
	  end
  }

  use {
    "hrsh7th/nvim-compe",
    config = function()
      require("compe").setup {
        min_length = 0,
        source = {
          buffer = true,
          nvim_lsp = true,
          nvim_lua = true,
        }
      }
      local utils = require("lsjostrom.utils")
      local check_behind = function()
        local is_empty = function(col)
          return col <= 0 or vim.fn.getline("."):sub(col, col):match("%s")
        end
        local pos_col = vim.fn.col(".") - 1
        return is_empty(pos_col) and is_empty(pos_col - 1) and true or false
      end

      _G.complete = function(pum, empty)
        if vim.fn.pumvisible() == 1 then
          return utils.term_codes(pum)
        elseif check_behind() then
          return utils.term_codes(empty)
        else
          return vim.fn["compe#complete"]()
        end
      end

      utils.mapx("is", "<C-Space>",   "v:lua.complete('<C-n>', '<Tab>')")
      utils.mapx("is", "<Tab>",   "v:lua.complete('<C-n>', '<Tab>')")
      utils.mapx("is", "<S-Tab>", "v:lua.complete('<C-p>', '<C-h>')")
      utils.mapx("x",  "<CR>",    "compe:#confirm('<CR')")
      utils.mapx("is", "<C-e>",   "compe#close('<C-e>')")
    end
  }

  use {
	  'lewis6991/gitsigns.nvim',
	  requires = {
		  'nvim-lua/plenary.nvim'
	  },
	  config = function()
		  require('gitsigns').setup {
			  numhl = true,
			  signs = {
				  add          = {hl = 'GitSignsAdd'   , text = '▌', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
				  change       = {hl = 'GitSignsChange', text = '▌', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
				  delete       = {hl = 'GitSignsDelete', text = '▖', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
				  topdelete    = {hl = 'GitSignsDelete', text = '▘', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
				  changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
			  },
		  }
	  end
  }

  use {
    "lukas-reineke/indent-blankline.nvim",
    branch = "master",
    config = function()
      -- vim.wo.colorcolumn = "100"
      vim.g.indent_blankline_char = "│"
      vim.g.indent_blankline_space_char = "⬝"
      vim.g.indent_blankline_space_char_highlight_list = { 'IndentSpace' }
      -- vim.g.indent_blankline_char_list = {'|', '¦', '┆', '┊'}
      vim.g.indent_blankline_buftype_exclude = {"help", "terminal"}
      vim.g.indent_blankline_filetype_exclude = {"text", "markdown"}
      -- vim.g.indent_blankline_show_end_of_line = true
      vim.g.indent_blankline_show_first_indent_level = true
      vim.g.indent_blankline_show_trailing_blankline_indent = true
      vim.g.indent_blankline_char_highlight_list = { 'Indent1', 'Indent2', 'Indent3', 'Indent4', 'Indent5', 'Indent6'}
    end
  }

  use {
    'neovim/nvim-lspconfig',
    config = function()
      require('lsjostrom.lsp-config')
      local map = require('lsjostrom.utils').map
      map('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>')
      map('i', '<C-k>', '<Cmd>lua vim.lsp.buf.signature_help()<CR>')
      map('n', '1gd', '<Cmd>lua vim.lsp.buf.type_definition()<CR>')
      map('n', 'gf',  '<Cmd>lua vim.lsp.buf.formatting()<CR>')
      map('n', 'rn',  '<Cmd>lua vim.lsp.buf.rename()<CR>')
      map('n', '[d',  '<Cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
      map('n', ']d',  '<Cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
      map('n', 'gwa',  '<Cmd>lua vim.lsp.buf.add_workspace_folder()<CR>')
      map('n', 'gwr',  '<Cmd>lua vim.lsp.buf.add_workspace_folder()<CR>')
      map('n', 'gwl',  '<Cmd>lua vim.lsp.buf.add_workspace_folder()<CR>')
    end
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-fzy-native.nvim',
      'nvim-telescope/telescope-github.nvim'
    },
    config = function()
      require('lsjostrom.telescope')
      local map = require('lsjostrom.utils').map
      map('n', '<leader>b', '<cmd>lua require("telescope.builtin").buffers()<CR>')
      map('n', '<leader>f', '<cmd>lua require("telescope.builtin").oldfiles()<CR>')
      map('n', '<space>',   '<cmd>lua require("telescope.builtin").oldfiles()<CR>')
      map('n', '<leader>e', '<cmd>lua require("telescope.builtin").git_files()<CR>')
      map('n', '<leader>g', '<cmd>lua require("telescope.builtin").git_status()<CR>')
      map('n', '<leader>a', '<cmd>lua require("telescope.builtin").lsp_code_actions()<CR>')
      map('n', '<leader>s', '<cmd>lua require("telescope.builtin").lsp_document_symbols()<CR>')
      map('n', '<leader>t', '<cmd>lua require("telescope.builtin").treesitter()<CR>')
      map('n', '<leader>/', '<cmd>lua require("telescope.builtin").live_grep()<CR>')
      map('n', '<leader>.', '<cmd>lua require("telescope.builtin").file_browser()<CR>')
      map('n', '<leader>p', '<cmd>lua require("telescope.builtin").registers()<CR>')
      map('n', 'gr', '<cmd>lua require("telescope.builtin").lsp_references()<CR>')
      map('n', 'gd', '<cmd>lua require("telescope.builtin").lsp_definitions()<CR>')
      map('n', 'g/', '<cmd>lua require("telescope.builtin").lsp_document_symbols()<CR>')
      map('n', 'g?', '<cmd>lua require("telescope.builtin").lsp_workspace_symbols()<CR>')
      map('n', 'ge', '<cmd>lua require("telescope.builtin").lsp_document_diagnostics()<CR>')
    end
  }

  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    requires = {
      "nvim-treesitter/playground",
      "nvim-treesitter/nvim-treesitter-textobjects",
      "windwp/nvim-ts-autotag"
    },
    config = function()
      require("lsjostrom.treesitter")
      vim.wo.foldmethod = "expr"
      vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
    end
  }

	use {
		"ray-x/go.nvim",
		config = function()
			require('go').setup({
				comment_placeholder = ''
			})
			vim.cmd("autocmd FileType go nmap <Leader>c :lua require('go.comment').gen()<cr>")
			vim.cmd("autocmd BufWritePre *.go :silent! lua require('go.format').gofmt()")
			vim.cmd('autocmd BufWritePre (InsertLeave?) <buffer> lua vim.lsp.buf.formatting_sync(nil,500)')
		end
	}

  use {
	  "onsails/lspkind-nvim",
	  config = function()
		  require('lspkind').init({
		  })
	  end
  }

  use {
    "~/src/github.com/shelmangroup/nvim-shelman-theme",
    requires ={{'tjdevries/colorbuddy.vim'}},
    config = function()
      require('colorbuddy').colorscheme('shelman-light')
    end
  }

	use {
		"cuducos/yaml.nvim",
		ft = {"yaml"},
		requires = {
			"nvim-treesitter/nvim-treesitter",
			-- "nvim-telescope/telescope.nvim" -- optional
		},
		config = function ()
			require("yaml_nvim").init()
		end
	}
end)
