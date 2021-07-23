{
  description = "Dylan's darwin system";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-21.05-darwin";
    darwin.url = "github:lnl7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, darwin, nixpkgs }: {
    darwinConfigurations."Dylans-MacBook" = darwin.lib.darwinSystem {
      modules = [ ./configuration.nix ];
    };
  };
}
