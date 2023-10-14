# default.nix
{ config, inputs, pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    systemdIntegration = true;
    extraConfig = ''
        # copy your existing hyprland.conf file here
        decortation {
            blur {
                enable = true
                # ...
            }
        # ...
        }
    '';
  };
}