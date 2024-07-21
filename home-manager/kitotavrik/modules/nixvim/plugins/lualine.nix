_:

{
	programs.nixvim.plugins.lualine = {
		enable = true;
		globalstatus = true;
			
		sections = {
			lualine_a = [{
				name = "mode";
			}];
			lualine_b = [{
				name = "branch";
				icon = "";
			}];
			lualine_c = [
				{
					name = "filetype";
					padding = { right = 0; left = 1; };

					extraConfig = {
						icon_only = true;
					};
				}
				{
					name = "filename";
					padding = { right = 1; left = 0; };
				}
			];
			lualine_x = [ "diagnostics" ];
			lualine_y = [{
				# Show active language server.
				icon = " ";
				name.__raw = ''
					function()
						local msg = ""
						local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
						local clients = vim.lsp.get_active_clients()
						if next(clients) == nil then
							return msg
						end
						for _, client in ipairs(clients) do
							local filetypes = client.config.filetypes
							if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
							return client.name
							end
						end
						return msg
					end
				'';
			}];
			lualine_z = [ "" ];
		};

		componentSeparators = {
			left = "";
			right = "";
		};


		sectionSeparators = {
			left = "";
			right = "";
		};
	};
}
