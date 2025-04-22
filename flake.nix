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
          neovim = pkgs.neovim-unwrapped;
          default = neovim;
        };

        app = rec {
          neovim = flake-utils.lib.mkApp { drv = self.packages.${system}.neovim; };
          default = neovim;
        };
      });
}
