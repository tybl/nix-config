{ pkgs, ... }: {
  # Don't change this when you change package input. Leave it alone.
  home.stateVersion = "22.11";

  # specify home-manager configs
  home = {
    packages = [
      pkgs.ripgrep
      pkgs.fd
    ];

    sessionVariables = {
      PAGER = "less";
      CLICOLOR = 1;
      EDITOR = "nvim";
    };
  };

  programs = {
#    doom-emacs = {
#      enable = true;
#      doomPrivateDir = ./doom.d;
#    };
    git = {
      enable = true;
      userName = "tybl";
      userEmail = "tybl@oro.lan";
    };

    neovim = {
      enable = true;
      defaultEditor = true;
    };

    ssh = {
      enable = true;
      extraConfig = ''
        IgnoreUnknown UseKeyChain
        UseKeyChain yes
      '';
    };

    starship = {
      enable = true;
      enableZshIntegration = true;
    };

    zsh = {
      enable = true;
      enableCompletion = true;
      enableAutosuggestions = true;
      enableSyntaxHighlighting = true;
      shellAliases = {
        ls = "ls --color=auto -F";
      };
    };
  };
}
