_:

{
	programs.nixvim.plugins = {
		lsp = {
			enable = true;
			servers = {
				clangd.enable = true;
				pyright.enable = true;
			};
		};


		# TODO: Enable lsp format.
		lsp-format.enable = false;
		lsp-lines.enable = true;
	};
}
