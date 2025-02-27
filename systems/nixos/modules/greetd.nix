_:

{
  services.greetd = {
    enable = true;
    settings = rec {
      initial_session = {
        command = "
					while true; do
						dwl-start
					done
				";
        user = "kitotavrik";
      };
      default_session = initial_session;
    };
  };
}
