{
  lib,
  ...
}:

let
  monitorType = lib.types.submodule {
    options = {
      name = lib.mkOption {
        type = lib.types.str;
      };

      adaptive = lib.mkOption {
        type = lib.types.bool;
        default = false;
      };
      mfact = lib.mkOption {
        type = lib.types.float;
        default = 0.5;
      };
      mode = lib.mkOption {
        type = lib.types.ints.unsigned;
        default = 0;
      };
      rate = lib.mkOption {
        type = lib.types.float;
        default = 60.0;
      };
      scale = lib.mkOption {
        type = lib.types.float;
        default = 1.0;
      };
      position = {
        x = lib.mkOption {
          type = lib.types.int;
          default = 0;
        };
        y = lib.mkOption {
          type = lib.types.int;
          default = 0;
        };
      };
      resolution = {
        x = lib.mkOption {
          type = lib.types.int;
          default = 0;
        };
        y = lib.mkOption {
          type = lib.types.int;
          default = 0;
        };
      };
    };
  };

in
{
  options.monitors = lib.mkOption {
    type = lib.types.listOf monitorType;
    default = [ ];
  };
}
