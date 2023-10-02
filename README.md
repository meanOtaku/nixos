# nixos
My own nixos/flake config
```
nix.settings.experimental-features = [ "nix-command" "flakes" ];
```
```
sudo nixos-rebuild switch
```
```
sudo nixos-rebuild switch --flake './my-nix-flake#<your_host_name>'
```
```
sudo nix-channel --add https://github.com/nix-community/home-manager/archive/release-23.05.tar.gz home-manager
sudo nix-channel --update
```
```
nix-shell '<home-manager>' -A install
```
```
home-manager switch --flake ./my-nix-flake#<USERNAME>
```
