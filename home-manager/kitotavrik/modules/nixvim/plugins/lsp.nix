_:

{
	programs.nixvim.plugins = {
		lsp = {
			enable = true;
			servers = {
				clangd.enable = true;
				pyright.enable = true;
				rust-analyzer = {
					enable = true;
					installRustc = false;
					installCargo = false;
				};
			};
		};

		# TODO: Enable lsp format.
		lsp-format.enable = false;
		lsp-lines.enable = true;
	};
}
