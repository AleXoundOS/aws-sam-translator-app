{
  description = "Application for converting SAM templates to CloudFormation templates.";

  inputs.nixpkgs.url = github:nixos/nixpkgs;

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      apps.${system}.default = {
        type = "app";
        program = self.packages.${system}.default + "/bin/sam-translate.py";
      };
      packages.${system}.default = with pkgs.python3Packages;
        toPythonApplication (
          aws-sam-translator.overridePythonAttrs (old: {
            postPatch = old.postPatch + ''
              # add sam-translate.py to scripts
              sed -i -s 's/^setup($/setup(\n    scripts=["bin\/sam-translate.py"],/g' setup.py
            '';
            doCheck = false;
            propagatedBuildInputs = old.propagatedBuildInputs ++ [ pyyaml ];
          })
        );
    };
}
