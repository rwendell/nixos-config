{ lib, ... }:
{

	settings = {
		number = true;
		relativenumber = true;
		tabstop = 4;
		softtabstop = 4;
		shiftwidth = 4;
		swapfile = false;
		backup = false;
		undofile = true;
		undodir = "/home/rwendell/.vim/undodir";
		hlsearch = true;
		incsearch = true;
		termguicolors = true;
		scrolloff = 8;
		updatetime = 50;
		clipboard = "unnamedplus";
		breakindent = true;
		ignorecase = true;
		smartcase = true;
		splitright = true;
		splitbelow = true;
		inccommand = "split";
		confirm = true;
		laststatus = 3;
	};

	globals.mapleader = " ";
	globals.maplocalleader = "\\";

	disabledRtpPlugins = [
		"gzip"
			"netrwPlugin"
			"tarPlugin"
			"tohtml"
			"tutor"
			"zipPlugin"
	];

	keymaps = [
	{
		key = "<Esc>";
		action = "<cmd>nohlsearch<CR>";
		mode = "n";
	}
	{
		key = "J";
		action = "mzJ`z";
		mode = "n";
	}
	{
		key = "<C-d>";
		action = "<C-d>zz";
		mode = "n";
	}
	{
		key = "<C-u>";
		action = "<C-u>zz";
		mode = "n";
	}
	{
		key = "<C-h>";
		action = "<C-w><C-h>";
		mode = "n";
	}
	{
		key = "<C-l>";
		action = "<C-w><C-l>";
		mode = "n";
	}
	{
		key = "<C-j>";
		action = "<C-w><C-j>";
		mode = "n";
	}
	{
		key = "<C-k>";
		action = "<C-w><C-k>";
		mode = "n";
	}
	{
		key = "J";
		action = ":m '>+1<CR>gv=gv";
		mode = "v";
	}
	{
		key = "K";
		action = ":m '<-2<CR>gv=gv";
		mode = "v";
	}
	{
		key = "<leader>p";
		action = "\"_dP";
		mode = "x";
	}
	{
		key = "gd";
		action = ''function() vim.lsp.buf.definition() end'';
		mode = "n";
	}
	{
		key = "K";
		action = ''function() vim.lsp.buf.hover() end'';
		mode = "n";
	}
	{
		key = "<leader>ca";
		action = ''function() vim.lsp.buf.code_action() end'';
		mode = "n";
	}
	{
		key = "<leader>cr";
		action = ''function() vim.lsp.buf.references() end'';
		mode = "n";
	}
	{
		key = "<leader>crn";
		action = ''function() vim.lsp.buf.rename() end'';
		mode = "n";
	}
	{
		key = "<leader>fc";
		action = "<cmd>Oil<CR>";
		mode = "n";
	}
	{
		key = "<leader>ft";
		action = ''function() require("mini.files").open(vim.api.nvim_buf_get_name(0), true) end'';
		mode = "n";
	}
	{
		key = "<leader>ct";
		action = "<cmd>Trouble diagnostics<CR>";
		mode = "n";
	}
	{
		key = "<leader>su";
		action = ''function() require("snacks").picker.undo() end'';
		mode = "n";
	}
	{
		key = "s";
		action = ''function() require("flash").jump() end'';
		mode = "n";
	}
	{
		key = "s";
		action = ''function() require("flash").jump() end'';
		mode = "x";
	}
	{
		key = "s";
		action = ''function() require("flash").jump() end'';
		mode = "o";
	}
	{
		key = "S";
		action = ''function() require("flash").treesitter() end'';
		mode = "n";
	}
	{
		key = "S";
		action = ''function() require("flash").treesitter() end'';
		mode = "x";
	}
	{
		key = "r";
		action = ''function() require("flash").remote() end'';
		mode = "o";
	}
	{
		key = "R";
		action = ''function() require("flash").treesitter_search() end'';
		mode = "o";
	}
	{
		key = "R";
		action = ''function() require("flash").treesitter_search() end'';
		mode = "x";
	}
	{
		key = "<c-s>";
		action = ''function() require("flash").toggle() end'';
		mode = "c";
	}
	{
		key = "<leader>hH";
		action = ''function() require("harpoon"):list():add() end'';
		mode = "n";
	}
	{
		key = "<leader>hh";
		action = ''function() local harpoon = require("harpoon") require("harpoon").ui:toggle_quick_menu(harpoon:list()) end'';
		mode = "n";
	}
	{
		key = "<leader>h1";
		action = ''function() require("harpoon"):list():select(1) end'';
		mode = "n";
	}
	{
		key = "<leader>h2";
		action = ''function() require("harpoon"):list():select(2) end'';
		mode = "n";
	}
	{
		key = "<leader>h3";
		action = ''function() require("harpoon"):list():select(3) end'';
		mode = "n";
	}
	{
		key = "<leader>h4";
		action = ''function() require("harpoon"):list():select(4) end'';
		mode = "n";
	}
	{
		key = "<leader>h5";
		action = ''function() require("harpoon"):list():select(5) end'';
		mode = "n";
	}
	{
		key = "<leader>cm";
		action = "<cmd>Mason<CR>";
		mode = "n";
	}
	{
		key = "<leader>dB";
		action = ''function() require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: ")) end'';
		mode = "n";
	}
	{
		key = "<leader>db";
		action = ''function() require("dap").toggle_breakpoint() end'';
		mode = "n";
	}
	{
		key = "<leader>dc";
		action = ''function() require("dap").continue() end'';
		mode = "n";
	}
	{
		key = "<leader>da";
		action = ''function() require("dap").continue({ before = get_args }) end'';
		mode = "n";
	}
	{
		key = "<leader>dC";
		action = ''function() require("dap").run_to_cursor() end'';
		mode = "n";
	}
	{
		key = "<leader>dg";
		action = ''function() require("dap").goto_() end'';
		mode = "n";
	}
	{
		key = "<leader>di";
		action = ''function() require("dap").step_into() end'';
		mode = "n";
	}
	{
		key = "<leader>dj";
		action = ''function() require("dap").down() end'';
		mode = "n";
	}
	{
		key = "<leader>dk";
		action = ''function() require("dap").up() end'';
		mode = "n";
	}
	{
		key = "<leader>dl";
		action = ''function() require("dap").run_last() end'';
		mode = "n";
	}
	{
		key = "<leader>do";
		action = ''function() require("dap").step_out() end'';
		mode = "n";
	}
	{
		key = "<leader>dO";
		action = ''function() require("dap").step_over() end'';
		mode = "n";
	}
	{
		key = "<leader>dP";
		action = ''function() require("dap").pause() end'';
		mode = "n";
	}
	{
		key = "<leader>dr";
		action = ''function() require("dap").repl.toggle() end'';
		mode = "n";
	}
	{
		key = "<leader>ds";
		action = ''function() require("dap").session() end'';
		mode = "n";
	}
	{
		key = "<leader>dt";
		action = ''function() require("dap").terminate() end'';
		mode = "n";
	}
	{
		key = "<leader>dw";
		action = ''function() require("dap.ui.widgets").hover() end'';
		mode = "n";
	}
	{
		key = "<c-space>";
		action = "Increment Selection";
		mode = "n";
	}
	{
		key = "<bs>";
		action = "Decrement Selection";
		mode = "x";
	}
	];

	autoCmd = [
	{
		event = "TextYankPost";
		desc = "Highlight when yanking text";
		callback = { __raw = "function() vim.highlight.on_yank() end"; };
	}
	];
}
