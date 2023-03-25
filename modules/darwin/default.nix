{ pkgs, ... }: {
  # backwards compat; don't change
  system.stateVersion = 4;

  # here go the darwin preferences and config items
  environment = {
    shells = [
      pkgs.bash
      pkgs.zsh
    ];
    loginShell = pkgs.zsh;
    systemPackages = [
      pkgs.coreutils
    ];
  };

  fonts = {
    fontDir.enable = true;
    fonts = [
      (pkgs.nerdfonts.override { fonts = [ "Meslo" ]; })
    ];
  };

  homebrew = {
    enable = true;
    casks = [
      "obsidian"
      "rectangle"
    ];
  };

  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  programs.zsh.enable = true;

  services.nix-daemon.enable = true;

  system = {
    defaults = {
      finder.AppleShowAllExtensions = true;
      dock.autohide = true;
    };
    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToEscape = true;
    };
  };
}
