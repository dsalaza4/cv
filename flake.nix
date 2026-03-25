{
  description = "My personal CV";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs =
    inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
        "aarch64-darwin"
        "x86_64-darwin"
        "aarch64-linux"
      ];

      perSystem =
        { pkgs, self', ... }:
        {
          packages.default = pkgs.writeShellApplication {
            name = "cv";
            runtimeInputs = [ pkgs.rendercv ];
            text = ''
              rendercv render cv.yaml
            '';
          };

          devShells.default = pkgs.mkShell {
            packages = [
              pkgs.rendercv
              self'.packages.default
            ];
          };
        };
    };
}
