{
    programs.hyprland = {
        enable = true;
        xwayland.enable = true;
        environment.systemPackages = [
            (pkgs.waybar.overrideAttrs (oldAttrs: {
                mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
            }))
            pkgs.dunst
            libnotify
        ];
        xdg.portal.enable = true;
        xdg.portal.extraPortals = [
            pkgs.xdg-desktop-portal-gtk
        ];
    };
}