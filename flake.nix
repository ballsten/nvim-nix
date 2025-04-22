{
  description = "Ballsten's Neovim Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }: {

    packages.x86_64-linux.neovim = nixpkgs.legacyPackages.x86_64-linux.neovim-unwrapped;

    packages.x86_64-linux.default = self.packages.x86_64-linux.neovim;

  };
}
