{ pkgs, ...}: {

##########################################################################
# 
#  Install all apps and packages here.
#
#  NOTE: Your can find all available options in:
#    https://daiderd.com/nix-darwin/manual/index.html
# 
# TODO Fell free to modify this file to fit your needs.
#
##########################################################################
nixpkgs.config = {
        allowUnfree = true;
        allowUnsupportedSystem = true;
    };
# Install packages from nix's official package repository.
# The packages installed here are available to all users, and are reproducible across machines, and are rollbackable.
# But on macOS, it's less stable than homebrew.
# Related Discussion: https://discourse.nixos.org/t/darwin-again/29331
    environment.systemPackages = with pkgs; [
        git
        cmatrix
        clang
        nodejs
        mpv
        wallust
        lazygit
        jetbrains-mono
    ];

# TODO To make this work, homebrew need to be installed manually, see https://brew.sh
# 
# The apps installed by homebrew are not managed by nix, and not reproducible!
# But on macOS, homebrew has a much larger selection of apps than nixpkgs, especially for GUI apps!
    homebrew = {
        enable = true;

        onActivation = {
            upgrade = true;
            autoUpdate = false;
            cleanup = "zap";
# 'zap': uninstalls all formulae(and related files) not listed here.
        };

# `brew install`
# TODO Feel free to add your favorite apps here.
        brews = [
            "neovim"
            "btop"
            "pass"
            "zoxide"
            "fzf"
            "gpg"
            "tldr"
            "rename"
            "yt-dlp"
            "highlight"
            "pipx"
            "llvm"
        ];

        casks = [
            "arc"
            "raycast"
            "hiddenbar"
            "basictex"
            "tex-live-utility"
            "mediamate"
            "shottr"
            "calibre"
            "rstudio"
            "alacritty"
            "obsidian"
            "firefox"
        ];
    };
}
