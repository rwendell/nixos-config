{ lib, ... }:
{
	plugins.snacks = {
		enable = true;
		autoLoad = true;
	};

	plugins.noice = {
		enable = true;
		autoLoad = true;
		settings = {
			presets = {
				bottom_search = true;
				command_palette = true;
				long_message_to_split = true;
				inc_rename = false;
				lsp_doc_border = false;
			};
		};
	};

	plugins.conform-nvim = {
		enable = true;
		autoLoad = true;
		settings = {
			default_format_opts = {
				timeout_ms = 3000;
				async = false;
				quiet = false;
				lsp_format = "fallback";
			};
			format_on_save = {
				timeout_ms = 500;
			};
		};
	};

	plugins.lazydev = {
		enable = true;
	};

	plugins.todo-comments = {
		enable = true;
	};

	plugins.ts-comments = {
		enable = true;
	};

	plugins.schemastore = {
		enable = true;
	};

	plugins.yanky = {
		enable = true;
	};

	plugins.fidget = {
		enable = true;
	};

	plugins.friendly-snippets = {
		enable = true;
	};

	plugins.luasnip = {
		enable = true;
	};

	plugins.mini-files = {
		enable = true;
	};

	plugins.web-devicons = {
		enable = true;
	};

	plugins.mini-icons = {
		enable = true;
	};

	plugins.kanso = {
		enable = true;
		settings.background = {
			dark = "zen";
			light = "pearl";
		};
	};

	plugins.vim-suda = {
		enable = true;
		settings = {
			executable = "doas";
			smart_edit = 1;
		};
	};
}
