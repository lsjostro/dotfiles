final: prev:

let
  py = prev.python3Packages;
in
{
  gerrit-mcp-server = py.buildPythonApplication {
    pname = "gerrit-mcp-server";
    version = "0-unstable-2026-03-23";

    src = prev.fetchFromGitHub {
      owner = "GerritCodeReview";
      repo = "gerrit-mcp-server";
      rev = "5666642afe1a5217e2529225d4bd9c9df6310bd6";
      hash = "sha256-ltRIBepgONuBTyD77WMzktT1NXrz8sFK2vr0dgo4a20=";
    };

    postPatch = ''
      substituteInPlace gerrit_mcp_server/main.py \
        --replace-fail \
          'SERVER_ROOT_PATH = PKG_PATH.parent' \
          'SERVER_ROOT_PATH = Path.home() / ".local" / "share" / "gerrit-mcp-server"' \
        --replace-fail \
          'LOG_FILE_PATH = SERVER_ROOT_PATH / "server.log"' \
          'SERVER_ROOT_PATH.mkdir(parents=True, exist_ok=True); LOG_FILE_PATH = SERVER_ROOT_PATH / "server.log"'
    '';

    pyproject = true;
    build-system = with py; [ setuptools ];

    propagatedBuildInputs = with py; [
      mcp
      uvicorn
      websockets
    ];

    # No [project.scripts] upstream — create entry point manually.
    # wrapPythonPrograms will patch the shebang and set PYTHONPATH.
    postInstall = ''
            mkdir -p $out/bin
            cat > $out/bin/gerrit-mcp-server << 'EOF'
      #!/usr/bin/env python3
      from gerrit_mcp_server.main import cli_main
      import sys
      cli_main(sys.argv)
      EOF
            chmod +x $out/bin/gerrit-mcp-server
    '';

    doCheck = false;
  };
}
