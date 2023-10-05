{ config, pkgs, ... }:

{
    imports =
    [
      ./apps/zsh.nix
      ./apps/fzf.nix  
    ];
    home.username = "vaibhav";
    home.homeDirectory = "/home/vaibhav";
    home.stateVersion = "23.05";
    home.packages = with pkgs; [ 
            httpie 
        ];
}
