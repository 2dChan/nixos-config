_:

{
	programs.nixvim.plugins = {
		luasnip.enable = true;

		cmp-buffer.enable = true;
		cmp-emoji.enable = true;
		cmp_luasnip.enable = true;
		cmp-path.enable = true;
		cmp-nvim-lsp.enable = true;
		
		cmp = {
			enable = true;
			
			settings = {
				experimental.ghost_text = true;
				
				performance = {
					max_view_entries = 10;
				};

				snippet.expand = ''
					function(args)
						require('luasnip').lsp_expand(args.body)
					end
				'';

				sources = [
					{ name = "nvim_lsp"; }
					{ name = "buffer"; }
					{ name = "emoji"; }
					{ name = "luasnip"; }
				];

				window = {
					completion = {
						scrollbar = false;
						border = "rounded";
						winhighlight = 
							"Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None";
						pumheght = 1;
					};
					
					documentation = {
						border = "rounded";
					};
				};

				mapping = {
					"<Tab>" = "cmp.mapping.confirm({ select = true })";
					# Navigation.
					"<C-j>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
					"<C-k>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
				};
				
				formatting.format = ''
					function(_, vim_item)
						local icons = {
							Text = " 󰊄 ",
							Method = "  ",
							Function = " 󰡱 ",
							Constructor = "  ",
							Field = "  ",
							Variable = " 󱀍 ",
							Class = "  ",
							Interface = "  ",
							Module = " 󰕳 ",
							Property = "  ",
							Unit = "  ",
							Value = "  ",
							Enum = "  ",
							Keyword = "  ",
							Snippet = "  ",
							Color = "  ",
							File = "  ",
							Reference = "  ",
							Folder = "  ",
							EnumMember = "  ",
							Constant = "  ",
							Struct = "  ",
							Event = "  ",
							Operator = "  ",
							TypeParameter = "  ",
						}
						vim_item.menu = vim_item.kind
						vim_item.kind = icons[vim_item.kind] or "FOO"
						return vim_item
					end
				'';
			};
		};
	};
}
