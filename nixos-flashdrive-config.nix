# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Switch to Linux-zen
  boot.kernelPackages = pkgs.linuxPackages_zen;

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true; # Enable networkManager

  # Set your time zone.
  time.timeZone = "Asia/Beirut";

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.enp2s0.useDHCP = true;
  networking.interfaces.wlp3s0.useDHCP = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  # };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  qt5.enable = false;
  programs = {
    fish.enable = true;
    zsh = {
      enable = true;
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;
    };
  };

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  # # Enable the Plasma 5 Desktop Environment.
  # services.xserver.displayManager.sddm.enable = true;
  # services.xserver.desktopManager.plasma5.enable = true;

  environment.variables.QT_QPA_PLATFORMTHEME = "qt5ct";

  # Configure keymap in X11
  # services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # sound.enable = true;
  # hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput.enable = true;

  services.xserver.extraLayouts.usmod = {
    description = ''
      Modified to:
        - swap brackets and paranthesis
        - swap RAlt for Super (Useful on external keyboard)
    '';
    languages = [ "eng" ];
    symbolsFile = ./extra/usmod;
  };

  users.groups.yaman = {
    name = "yaman";
    members = [ "yaman" ];
    gid = 1000;
  };
  users.users.yaman = {
    isNormalUser = true;
    extraGroups = [
      "wheel"          # Enable ‘sudo’ for the user.
      "networkmanager" # Enable the user to modify network properties.
    ];
    shell = pkgs.fish; # Change user shell to fish
  };

  # Installed programs {{{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  nixpkgs.overlays = [
    (import (builtins.fetchTarball https://github.com/nix-community/emacs-overlay/archive/master.tar.gz)) # Installing Emacs 28+ will require nix-community/emacs-overlay:
  ];
  # nixpkgs.config.allowUnfree = true;
  environment.systemPackages = ( with pkgs; [
    emacsGcc neovim                              # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget deluge                               # Everything download related
    ripgrep
    coreutils
    clang gcc                                 # C/C++ Compilers
    tealdeer                                  # Docs/Help
    exa fd                                    # Rust cli utils
    alacritty                           # Terminal emulators
    htop btop                                 # System monitors
    keepassxc                                 # Password managers
    rclone
    mpd mpc_cli ncmpcpp                       # Music
    git
    zip unzip atool p7zip                     # Archive managers
    mpv                                       # Video Players
    # ghc cabal-install haskell-language-server # Everything haskell
    # jetbrains.idea-community
    # vscode-fhs
    # evolution
    tdesktop                                  # Telegram desktop
    tela-icon-theme              # Theming
    python3 pipenv                            # Python + utils
    html-tidy ktlint shellcheck        # Code checkers/formatters...
    openjdk
    killall
    # gnumake cmake                             # Build systems
    sqlite                                    # Databases
    editorconfig-core-c
    jq
    libvterm
    libtool
    kotlin
    zathura
    # zoom-us
    android-file-transfer android-tools
    qalculate-gtk libqalculate
    glib
    libnotify
    rtags racer rustup
    rust-analyzer-unwrapped
    xdg-utils
    archivemount sshfs trash-cli
    fastjar mediainfo imagemagick unrar-wrapper
    brave
    gnome.pomodoro
    # geogebra6
    # ark
    # ncdu duf
    # lldb nodejs gdb lldb_9
    gnome.seahorse # conflicts with kde for some dumb reason
    # poppler_utils
  ]) ++ ( with pkgs.python39Packages; [ # Include python39Packages
    isort
    nose
    pytest
    pip
    jsbeautifier
    setuptools
    conda
    yt-dlp
  ] ); # pckgsEnd }}}

  # Fonts {{{
  fonts = {
    # Install fonts
    fonts = with pkgs; [
      (nerdfonts.override { fonts = [ "FiraCode" "Iosevka" ]; })
      fira
      iosevka
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      libertinus
      emacs-all-the-icons-fonts
      cantarell-fonts
      open-sans
    ];
    fontconfig = {
      defaultFonts.monospace = [ "Iosevka SS05"
                                 "Iosevka Term SS05"
                                 "Iosevka"
                                 "FiraCode Nerd Font"
                                 "Noto Naskh Arabic UI"
                                 "Hack"
                               ];
      defaultFonts.sansSerif = [ "Open Sans"
                                 "Cantarell"
                                 "Noto Kufi Arabic"
                                 "Noto Naskh Arabic UI"
                                 "Fira Sans"
                                 "Inter"
                                 "Noto Sans"
                                 "Noto Sans CJK JP Light"
                               ];
      defaultFonts.serif = [ "Libertinus Serif"
                             "Calendas Plus"
                             "Times New Roman"
                             "Noto Naskh Arabic UI"
                             "Noto Serif"
                             "Noto Serif CJK JP"
                             "Noto Serif CJK TC"
                             "Noto Serif CJK HK"
                           ];
    };
  };

  # }}}
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Enable GVFS (for MTP)
  services.gvfs.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.05"; # Did you read the comment?

}

