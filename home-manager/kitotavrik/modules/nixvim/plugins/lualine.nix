_:

{
  programs.nixvim.plugins.lualine = {
    enable = true;

    settings = {
      sections = {
        lualine_a = [ "mode" ];
        lualine_b = [
          {
            __unkeyed-1 = "branch";
            icon = "";
          }
        ];
        lualine_c.__raw = ''
          					{
          						{ "filetype", icon_only = true, padding = { left = 1, right = 0 } },
                      { "filename", padding = { left = 0, right = 1 } },
          					}
          				'';
        lualine_x = [ "diagnostics" ];
        lualine_y = [
          {
            # Show active language server.
            icon = " ";
            __unkeyed-1.__raw = ''
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
          }
        ];
        lualine_z = [ "" ];
      };

      options = {
        globalstatus = true;

        component_separators = {
          left = "";
          right = "";
        };

        section_separators = {
          left = "";
          right = "";
        };
      };
    };
  };
}
