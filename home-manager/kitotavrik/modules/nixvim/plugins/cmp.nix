_:

{
	programs.nixvim.plugins = {
		cmp-nvim-lsp.enable = true;
		cmp-buffer.enable = true;
		cmp-emoji.enable = true;
		
		cmp = {
			enable = true;
			
			settings = {
				experimental.ghost_text = true;
				
				performance = {
					max_view_entries = 10;
				};

				sources = [
					{ name = "nvim_lsp"; }
					{ name = "buffer"; }
					# { name = "emoji"; }
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
					"<Enter>" = "cmp.mapping.confirm({ select = true })";
					# Navigation.
					"<Down>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
					"<Up>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
					"<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
					"<CTab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
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
