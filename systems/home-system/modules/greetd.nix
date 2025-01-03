_:

{
  services.greetd = {
    enable = true;
    settings = rec {
      initial_session = {
        command = "
					dwl-start
				";
        user = "kitotavrik";
      };
      default_session = initial_session;
    };
  };
}
