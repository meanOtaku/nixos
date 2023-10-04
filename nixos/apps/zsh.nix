{
 programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;
    shellAliases = {
      ll = "ls -l";
      update = "sudo nixos-rebuild switch";
    };
    oh-my-zsh = {
        enable = true;
        plugins = [ "docker-compose" "docker" ];
        theme = "dst";
      };
    initExtra = ''
      bindkey '^f' autosuggest-accept
    '';
  }; 
}
