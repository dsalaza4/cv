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
          packages = {
            default = pkgs.writeShellApplication {
              name = "cv";
              runtimeInputs = [ pkgs.rendercv ];
              text = ''
                rendercv render src/cv.yaml
              '';
            };

            cv-update-skills = pkgs.writeShellApplication {
              name = "cv-update-skills";
              runtimeInputs = [ pkgs.nodejs_24 ];
              text = ''
                npx skills update --yes
                npx skills experimental_sync
              '';
            };
          };

          devShells.default = pkgs.mkShell {
            packages = [
              pkgs.nodejs_24
              pkgs.rendercv
              self'.packages.default
              self'.packages.cv-update-skills
            ];
          };
        };
    };
}
