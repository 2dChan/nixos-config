_:

{
  projectRootFile = "flake.nix";

  programs.deadnix.enable = true;
  programs.statix.enable = true;
  programs.nixfmt.enable = true;
  programs.shfmt.enable = true;
  programs.prettier.enable = true;

  settings.excludes = [
    "*.lock"
    ".patch"
    "*/dwl/source/*"
  ];
}
