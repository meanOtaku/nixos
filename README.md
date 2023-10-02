# nixos
My own nixos/flake config
### nix.settings.experimental-features = [ "nix-command" "flakes" ];

### sudo nixos-rebuild switch
### sudo nixos-rebuild switch --flake './my-nix-flake#<your_host_name>'
### home-manager switch --flake ./my-nix-flake#<USERNAME>
