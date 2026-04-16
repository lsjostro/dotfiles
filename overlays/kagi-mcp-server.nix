final: prev:

let
  py = prev.python3Packages;

  kagiapi = py.buildPythonPackage {
    pname = "kagiapi";
    version = "0.2.1";
    format = "setuptools";

    src = prev.fetchurl {
      url = "https://files.pythonhosted.org/packages/35/3a/65b13878fd8cb88e58c9422f0eb1becd4cd5c93470f14fa2fd29b4a9f1db/kagiapi-0.2.1.tar.gz";
      hash = "sha256-NV/kB7TGg9bwhIJ+T4VP2VE03yhC8V0Inaz/Yg4/Sus=";
    };

    propagatedBuildInputs = with py; [
      requests
      typing-extensions
    ];

    doCheck = false;
  };
in
{
  kagi-mcp-server =
    let
      kagimcp = py.buildPythonApplication {
        pname = "kagimcp";
        version = "0.1.4";

        src = prev.fetchFromGitHub {
          owner = "kagisearch";
          repo = "kagimcp";
          rev = "73f36017d43d3ebbb6c140633968ed9660bddca7";
          hash = "sha256-sJIr4yoHPUGB5ZYj2A7e1zIIEgTykrLQDvDmQeu/6Mw=";
        };

        pyproject = true;
        build-system = with py; [ hatchling ];

        propagatedBuildInputs = with py; [
          kagiapi
          mcp
          pydantic
        ];

        doCheck = false;
      };
    in
    prev.writeShellApplication {
      name = "kagi-mcp-server";
      text = ''
        export KAGI_API_KEY
        KAGI_API_KEY=$(cat "$KAGI_API_KEY_FILE")
        exec ${kagimcp}/bin/kagimcp "$@"
      '';
    };
}
