{
  self,
  ...
}:
{
  system = {
    stateVersion = 6;
    configurationRevision = self.rev or self.dirtyRev or null;
  };

  home-manager.users.kitotavrik.home.stateVersion = "25.05";
}
