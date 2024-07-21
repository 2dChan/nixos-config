_:

{
	programs.nixvim.plugins = {
		lsp = {
			enable = true;
			servers = {
				rust-analyzer = {
					enable = true;
					installCargo = false;
					installRustc = false;
				};

				clangd.enable = true;
				nil-ls.enable = true;
			};
		};
		
		# TODO: Enable lsp format.
		lsp-format.enable = false;
		lsp-lines.enable = true;
	};
}
