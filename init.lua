-- Load custom options
require("config.options")

require("config.lazy")
-- require("mason-workaround")

-- You can also load other modules here, such as:
require("config.keymaps")
-- require("config.lsp_config")


-- require('neoscroll').setup({ mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>'} })

-- require("nvim-tree").setup {}


-- COLOR SCHEME SETTINGS
-- require("onedarkpro").setup({
	-- transparent_background = false,
	-- terminal_colors = true,
	-- devicons = true, -- highlight the icons of `nvim-web-devicons`
	-- styles = {
		-- comment = { italic = true },
		-- keyword = { italic = true }, -- any other keyword
		-- type = { italic = true }, -- (preferred) int, long, char, etc
		-- storageclass = { italic = true }, -- static, register, volatile, etc
		-- structure = { italic = true }, -- struct, union, enum, etc
		-- parameter = { italic = true }, -- parameter pass in function
		-- annotation = { italic = true },
		-- tag_attribute = { italic = true }, -- attribute of tag in reactjs
	-- },
	-- filter = "octagon", -- classic | octagon | pro | machine | ristretto | spectrum
-- })



-- Theme
vim.cmd([[colorscheme vaporwave]])

-- Bufferline
vim.opt.termguicolors = true
require("bufferline").setup{}

-- diagnostics = "nvim_lsp" | "coc"


-- require('mini.animate').setup({
  -- cursor = {
    -- -- Timing of animation (how steps will progress in time)
    -- enable = false
  -- },
  -- scroll = {
	-- timing = function(_, n) return 50 / n end
  -- }
-- })

-- require('mini.trailspace').setup()
require('mini.comment').setup()

vim.g.SexyScroller_ScrollTime = 30
vim.g.SexyScroller_CursorTime = 2
vim.g.SexyScroller_MaxTime = 350
vim.g.SexyScroller_EasingStyle = 1

require'cmp'.setup {
  sources = {
    { name = 'nvim_lsp' }
  }
}
local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('gitsigns').setup {
	current_line_blame = true,
	
	current_line_blame_opts = {
		virt_text = true,
		virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
		delay = 300,
		ignore_whitespace = true,
		virt_text_priority = 100,
		use_focus = true,
	}
}

-- require('neo-tree').setup({
  -- -- options go here
-- })

require('Comment').setup()

require("tiny-inline-diagnostic").setup({
    -- ...
    signs = {
        left = "",
        right = "",
        diag = "●",
        arrow = "    ",
        up_arrow = "    ",
        vertical = " │",
        vertical_end = " └",
    },
    blend = {
        factor = 0.22,
    },
    -- ...
})


require("ibl").setup()-- indent-blankline
require('rainbow-delimiters.setup').setup()

require("fzf-lua").setup({
  "hide",
  -- your other settings here 
})

local Path = require('plenary.path')
local config = require('session_manager.config')
require('lualine').setup()

-- require'nvim-treesitter.configs'.setup {
  -- -- A list of parser names, or "all" (the listed parsers MUST always be installed)
  -- ensure_installed = { "typescript" },

  -- -- Install parsers synchronously (only applied to `ensure_installed`)
  -- sync_install = false,

  -- -- Automatically install missing parsers when entering buffer
  -- -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  -- auto_install = true,

  -- -- List of parsers to ignore installing (or "all")
  -- ignore_install = { "javascript" },

  -- ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  -- highlight = {
    -- enable = true,

    -- -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- -- the name of the parser)
    -- -- list of language that will be disabled
    -- disable = { },
    -- -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    -- disable = function(lang, buf)
        -- local max_filesize = 100 * 1024 -- 100 KB
        -- local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        -- if ok and stats and stats.size > max_filesize then
            -- return true
        -- end
    -- end,

    -- -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- -- Instead of true it can also be a list of languages
    -- additional_vim_regex_highlighting = false,
  -- },
-- }

require('session_manager').setup({
  sessions_dir = Path:new(vim.fn.stdpath('data'), 'sessions'), -- The directory where the session files will be saved.
  session_filename_to_dir = session_filename_to_dir, -- Function that replaces symbols into separators and colons to transform filename into a session directory.
  dir_to_session_filename = dir_to_session_filename, -- Function that replaces separators and colons into special symbols to transform session directory into a filename. Should use `vim.uv.cwd()` if the passed `dir` is `nil`.
  autoload_mode = config.AutoloadMode.CurrentDir, -- Define what to do when Neovim is started without arguments. See "Autoload mode" section below.
  autosave_last_session = true, -- Automatically save last session on exit and on session switch.
  autosave_ignore_not_normal = true, -- Plugin will not save a session when no buffers are opened, or all of them aren't writable or listed.
  autosave_ignore_dirs = {}, -- A list of directories where the session will not be autosaved.
  autosave_ignore_filetypes = { -- All buffers of these file types will be closed before the session is saved.
    'gitcommit',
    'gitrebase',
  },
  autosave_ignore_buftypes = {}, -- All buffers of these bufer types will be closed before the session is saved.
  autosave_only_in_session = false, -- Always autosaves session. If true, only autosaves after a session is active.
  max_path_length = 80,  -- Shorten the display path if length exceeds this threshold. Use 0 if don't want to shorten the path at all.
  load_include_current = false,  -- The currently loaded session appears in the load_session UI.
})