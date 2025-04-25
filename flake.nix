{
  description = "Ballsten's Neovim Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system}; in 
      {
        packages = rec {
          ballsvim = pkgs.callPackage ./neovim.nix {};
          default = ballsvim;
        };

        apps = rec {
          ballsvim = flake-utils.lib.mkApp { 
            drv = self.packages.${system}.ballsvim;
            name = "nvim";
          };
          default = ballsvim;
        };
      });
}
