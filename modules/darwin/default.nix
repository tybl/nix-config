{ pkgs, ... }: {
  # here go the darwin preferences and config items
  environment.shells = [ pkgs.bash pkgs.zsh ];
  environment.loginShell = pkgs.zsh;
  environment.systemPackages = [ pkgs.coreutils ];
  fonts.fontDir.enable = true;
  fonts.fonts =
    [ (pkgs.nerdfonts.override { fonts = [ "Meslo" ]; }) ];
  homebrew.enable = true;
  homebrew.casks = [
    "obsidian"
    "rectangle"
  ];
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';
  programs.zsh.enable = true;
  services.nix-daemon.enable = true;
  system.defaults.finder.AppleShowAllExtensions = true;
  system.defaults.dock.autohide = true;
  system.keyboard.enableKeyMapping = true;
  system.keyboard.remapCapsLockToEscape = true;
  # backwards compat; don't change
  system.stateVersion = 4;
}
