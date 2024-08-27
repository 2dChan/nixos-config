_:

{
	programs.nixvim = {
		clipboard = {
			register = "unnamedplus";
			providers.wl-copy.enable = true;	
		};
		
		opts = {
			number = true;
			relativenumber = true;

			swapfile = false;
			
			# Mouse.
			mouse = "a";
			mousefocus = true;
			mousemodel = "extend";
			
			# Indent settings.
			autoindent = true;
			tabstop = 4;
			shiftwidth = 4;
			expandtab = false;
			
			colorcolumn = "80";
			wrap = true;
			breakindent = true;
			linebreak = true;
			showbreak = "->  ";
		};
	};
}

