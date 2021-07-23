# nix-darwin-flakes-test

This is a simple test to try out installing and using utilities and
applications with `nix-darwin` and flakes.

## Install `nix-darwin`

It's required to install `nix-darwin` to setup the proper symlinks and
environment prior to trying to install flakes.

1.  Build the installer

    ```bash
    nix-build https://github.com/LnL7/nix-darwin/archive/master.tar.gz -A installer
    ```

2.  Run the installer

    ```bash
    sudo ./result/bin/darwin-installer
    ```

3.  Go through the installer interactive steps

    ```bash
    # Installing nix-darwin...
    #
    # Would you like to edit the default configuration.nix before starting? [y/n] n
    # Would you like to manage <darwin> with nix-channel? [y/n] n
    ```

## Install flake

Even though `nix-darwin` has been installed, a separate installer that supports
flakes is required to install flakes.

1.  Build the installer that works with flakes

    ```bash
    nix --experimental-features 'nix-command flakes' build ./\#darwinConfigurations.Dylans-MacBook.system
    ```

2.  Install the flake

    ```bash
    sudo ./result/sw/bin/darwin-rebuild switch --flake ./\#Dylans-MacBook
    ```
