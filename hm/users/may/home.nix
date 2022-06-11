system-name: { config, pkgs, lib, ... }:

let local-scripts = "/home/may/.local/bin";
in
{
  imports = [
    ../../desktops/xdg-mime-apps.nix
    ../../desktops/wms/wayfire
    ../../desktops/wayland-tools.nix
    ../../programs/neovim
  ] ++
  lib.optional (system-name=="despair") ../../toolsets/graphics.nix ;
  

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "may";
  home.homeDirectory = "/home/may";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.03";

  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    cantata # media playback
    alacritty # Terminal Emulator

    #kicad # Electronics

    # Communication
    signal-desktop
    
    bash

    fzf
    ripgrep

    (nerdfonts.override { fonts = ["Iosevka" "VictorMono"]; })

    vscode

    libreoffice
    
    gnome.gnome-keyring
  ];

  programs.firefox = {
    enable = true;
    package = pkgs.firefox-wayland;
  };

  programs.zsh = {
    enable = true;
    autocd = true;
  };

  programs.git = {
    enable = true;
    userName = "Johannes May";
    userEmail = "johannes@may-se.de";
  };

  programs.alacritty = {
    enable = true;
    settings = {
      font.normal.family = "VictorMono Nerd Font";
    };
  };

  services.nextcloud-client = {
    enable = true;
    # Nextcloud does not work properly with QT_QPA_PLATFORM=wayland, so we fallback to xcb here
    #package = pkgs.nextcloud-client.overrideAttrs (old: { qtWrapperArgs =  (old.qtWrapperArgs or []) ++ ["--set QT_QPA_PLATFORM xcb"];}); 
  };


  # TODO: This needs to be migrated to the new mopidy hm integration, meaning a config migration from ini to nix is needed
  # services.mopidy = {
  #   enable = true;
  #   extensionPackages = [
  #     pkgs.mopidy-spotify
  #     pkgs.mopidy-mpd
  #     pkgs.mopidy-local 
  #   ];
  #   configuration = import ./mopidy_conf.nix;
  #   extraConfigFiles = [ "~/.config/credentials/mopidy.conf" ];
  # };

  services.pasystray.enable = true;
  services.network-manager-applet.enable = true;

  home.sessionVariables = {
    PATH = "$PATH:$HOME/.gem/ruby/2.5.0/bin:$HOME/Utility:$HOME/.bin:$HOME/.programs/adb/platform-tools/:$HOME/.gwt2.8.1/:$HOME/.pub-cache/bin:/home/may/.cargo/bin:/home/may/go/bin:${local-scripts}";
    VISUAL = "vim";
    TERMINAL = "alacritty";
    SWT_GTK3 = "0";
    EDITOR = "vim";
    GOPATH = "$HOME/go:$GOPATH";
    # export KICAD_SYMBOL_DIR = /usr/share/kicad/library/ # TODO: Fixme for nixos
    # BROWSER = $(which firefox)
    OPENSCADPATH = "$HOME/3D/openscad/libs";
    # Fix QT applications broken scaling...
    QT_AUTO_SCREEN_SCALE_FACTOR = "0";
  };

}
