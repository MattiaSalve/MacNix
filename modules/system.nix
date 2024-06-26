{ pkgs, ... }:

#######################################################################
#  macOS's System configuration
#
#  All the configuration options are documented here:
#    https://daiderd.com/nix-darwin/manual/index.html#sec-options
#######################################################################
{

    system = {
        # activationScripts are executed every time you boot the system or run `nixos-rebuild` / `darwin-rebuild`.
        activationScripts.postUserActivation.text = ''
           # activateSettings -u will reload the settings from the database and apply them to the current session,
           # so we do not need to logout and login again to make the changes take effect.
            /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
            '';

        defaults = {
            menuExtraClock.Show24Hour = true;  # show 24 hour clock
                dock.autohide = true;
                dock.mru-spaces = false;
                dock.showhidden = true;
                dock.magnification = true;
                dock.tilesize = 64;
                dock.largesize = 70;
                finder.AppleShowAllExtensions = true;
                finder.FXPreferredViewStyle = "clmv";
                finder.CreateDesktop = false;
                finder.ShowPathbar = true;
                screencapture.location = "~/Pictures/screenshots";
                trackpad.Clicking = true;
        };
    };
    environment.shellAliases = {
            nixinstall = "cd ~/nix && nvim modules/apps.nix";
            sysconfig = "cd ~/nix && nvim modules/system.nix";
            nix-clean = "nix-env --delete-generations old && nix-store --gc";
        };

# Add ability to used TouchID for sudo authentication
    security.pam.enableSudoTouchIdAuth = true;

# Create /etc/zshrc that loads the nix-darwin environment.
# this is required if you want to use darwin's default shell - zsh
    programs.zsh.enable = true;
    nix.extraOptions = ''
  extra-platforms = x86_64-darwin aarch64-darwin
'';

}
