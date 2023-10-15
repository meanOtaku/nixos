# default.nix
{ config, inputs, pkgs, ... }:
{
  programs.hyprland = {
    enable = true; 
    xwayland.hidpi = true;
    xwayland.enable = true;
  };

  # Hint Electon apps to use wayland
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };
  wayland.windowManager.hyprland = {
    enable = true;
    systemdIntegration = true;
    extraConfig = ''
        exec-once=bash ~/vaibhav/nixos/start.sh
        $mod = SUPER

        bind = $mod, F, exec, firefox
        bind = , Print, exec, grimblast copy area

        # workspaces
        # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
        ${builtins.concatStringsSep "\n" (builtins.genList (
            x: let
            ws = let
                c = (x + 1) / 10;
            in
                builtins.toString (x + 1 - (c * 10));
            in ''
            bind = $mod, ${ws}, workspace, ${toString (x + 1)}
            bind = $mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}
            ''
        )
        10)}
    '';
  };
}