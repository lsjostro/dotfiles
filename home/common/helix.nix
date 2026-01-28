{
  pkgs,
  ...
}:
{

  programs.helix = {
    enable = true;

    extraPackages = with pkgs; [
      nixd
      nixfmt
      taplo
      asciidoctor
      vale
      (pkgs.hunspell.withDicts (dicts: [
        dicts.en_GB-ize
        dicts.en_US
        dicts.sv_SE
      ]))
      vscode-langservers-extracted
      typescript-language-server
      yaml-language-server
      typescript
      nodePackages.prettier
      bash-language-server
      marksman
      tinymist
      go
      gotools
      gopls
    ];

    defaultEditor = true;
    ignores = [
      "!.jj"
    ];

    languages = {

      language = [
        {
          name = "nix";
          auto-format = true;
        }
        {
          name = "rust";
          auto-format = true;
        }
      ];

    };

    settings = {

      theme = "wolf-alabaster-light-bg";

      editor = {
        auto-pairs = false;
        color-modes = true;
        line-number = "relative";
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
        inline-diagnostics = {
          cursor-line = "hint";
        };
        popup-border = "all";
        cursorline = true;
        true-color = true;
        undercurl = true;
      };

      keys.normal = {
        space.q = ":buffer-close";
        tab = [ "buffer_picker" ];
      };

    };
  };

  xdg.configFile."helix/themes/wolf-alabaster-dark.toml".source = builtins.fetchurl {
    url = "https://github.com/wolf/alabaster-for-helix/raw/refs/heads/main/helix/dot-config/helix/themes/wolf-alabaster-dark.toml";
    sha256 = "sha256:0x99k0w6gkmsql12z2j1qrwly1q9rf2kz7b5sn8nmap8d0cacg5s";
  };

  xdg.configFile."helix/themes/wolf-alabaster-light.toml".source = builtins.fetchurl {
    url = "https://github.com/wolf/alabaster-for-helix/raw/refs/heads/main/helix/dot-config/helix/themes/wolf-alabaster-light.toml";
    sha256 = "sha256:0388m2pzzsm75ybyypprkx7m7wb7b5s2vym8rn88k6z8n8635m5a";
  };

  xdg.configFile."helix/themes/wolf-alabaster-light-bg.toml".source = builtins.fetchurl {
    url = "https://github.com/wolf/alabaster-for-helix/raw/refs/heads/main/helix/dot-config/helix/themes/wolf-alabaster-light-bg.toml";
    sha256 = "sha256:1044yip99mcilrbj5bb7d355ld4vb17a70gwyj12qq4r3b9m3cvh";
  };
}
