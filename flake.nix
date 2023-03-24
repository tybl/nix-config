{
  description = "my minimal flake";
  inputs = {
    #
    #
    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.11";

    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    darwin.url = "github:lnl7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs = inputs: {
    darwinConfigurations.oro = inputs.darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      pkgs = import inputs.nixpkgs { system = "aarch64-darwin"; };
      modules = [
        ./modules/darwin
        # Home manager settings
        inputs.home-manager.darwinModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.tybl.imports = [
	      ./modules/home-manager
#              ({ pkgs, ... }: {
#                # Don't change this when you change package input. Leave it alone.
#                home.stateVersion = "22.11";
#                # specify home-manager configs
#                home.packages = [ pkgs.ripgrep pkgs.fd ];
#                home.sessionVariables = {
#                  PAGER = "less";
#                  CLICOLOR = 1;
#                  EDITOR = "nvim";
#                };
#                programs.git = {
#		  enable = true;
#		  userName = "tybl";
#		  userEmail = "tybl@oro.lan";
#		};
#                programs.neovim.enable = true;
#                programs.neovim.defaultEditor = true;
#		programs.ssh = {
#		  enable = true;
#		  extraConfig = ''
#		    IgnoreUnknown UseKeyChain
#		    UseKeyChain yes
#		  '';
#		};
#                programs.starship.enable = true;
#                programs.starship.enableZshIntegration = true;
#                programs.zsh.enable = true;
#                programs.zsh.enableCompletion = true;
#                programs.zsh.enableAutosuggestions = true;
#                programs.zsh.enableSyntaxHighlighting = true;
#                programs.zsh.shellAliases = { ls = "ls --color=auto -F"; };
#              })
            ];
          };
        }
      ];
    };
  };
}
