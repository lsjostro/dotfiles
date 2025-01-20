{ inputs, config, pkgs, lib,... }:
{

  home.packages = with pkgs; [
    delta
    diffedit3
    difftastic
    git-get
    git-graph
    tea
  ];

  programs.gh = {
    enable = true;
  };

  programs.git = {
    enable = true;

    aliases = {
      b = "branch -va";
      cl = "clone --filter=blob:none";
      co = "checkout";
      d = "diff --stat -p -C --color-words";
      ds = "diff --staged --stat -p -C --color-words";
      g = "graph -S -m simple -s round";
      guilt = "!f(){ git log --pretty='format:%an <%ae>' $@ | sort | uniq -c | sort -rn; }; f";
      lla = "log --graph --all --topo-order --pretty='format:\t%x1B[0;3;36m%as %x1B[0;95;3m%<(12)%al %x1B[3;32m• %h%x1B[0;1;92m%d%x1B[0m %s'";
      ll = "log --pretty='format:%x1B[0;3;36m%as %G? %x1B[0;95;3m%<(12,trunc)%al %x1B[3;32m• %h%x1B[0;1;92m%(decorate:prefix= [,suffix=]%n)%>|(35)%Creset %s'";
      patch = "!git --no-pager diff --no-color";
      pullr = "pull --rebase --autostash";
      sh = "show --stat -p -C --color-words --show-signature";
      st = "status -sb";
    };

    delta = {
      enable = true;
      options = {
        file-added-label = "[+]";
        file-decoration-style = "none";
        file-modified-label = "[*]";
        file-removed-label = "[-]";
        file-renamed-label = "[>]";
        file-style = "bold reverse";
        file-transformation = "s/$/  ░▒▓/";
        grep-file-style = "bold reverse";
        hunk-header-decoration-style = "none";
        hunk-header-file-style = "bold";
        hunk-header-line-number-style = "bold";
        hunk-header-style = "bold";
        hunk-label = "⯁";
        hunk-label-style = "bold";
        line-numbers = true;
        max-line-distance = "0.9";
        navigate = true;
      };
    };

    extraConfig = {
      apply.whitespace = "nowarn";
      blame.date = "relative";
      branch.main.rebase = true;
      color = {
        branch = "auto";
        diff = "auto";
        status = "auto";
        ui = "auto";
      };
      column.ui = "auto";
      core = {
        compression = 3;
        looseCompression = 3;
        excludesfile = "~/.config/git/ignore";
      };
      fetch = {
        prune = true;
        prunetags = true;
        showForcedUpdates = true;
      };
      gitget = {
        root = "${config.home.homeDirectory}/src/oss";
      };
      gpg = {
        format = "ssh";
        ssh = {
          allowedSignersFile = "${config.home.homeDirectory}/.ssh/authorized_keys";
          defaultKeyCommand = "${config.home.homeDirectory}/.local/bin/git-signing-key";
        };
      };
      init.defaultBranch = "main";
      merge.conflictstyle = "zdiff3";
      pack = {
        compression = 3;
        threads = 0;
      };
      pull.rebase = true;
      push.default = "tracking";
      rebase.autosquash = true;
      rerere.enabled = true;
      tag.sort = "-v:refname";
      user.useConfigOnly = true;
    };

    ignores = [
      "*~"
      "*.a"
      "*.class"
      "*.iml"
      "*.ipr"
      "*.iwr"
      "*.iws"
      "*.la"
      "*.o"
      "*.pyc"
      "*.so"
      "*.swp"
      ".direnv"
      ".env"
      ".idea"
      ".nixos-test-history"
      ".null-ls_*"
      "/result*"
      "/target"
    ];

    signing = {
      key = null;
      signByDefault = true;
    };
  };

  programs.jujutsu = {
    enable = true;
    package = inputs.jujutsu.packages.${pkgs.system}.default;

    settings = {

      signing = {
        sign-all = true;
        backend = "ssh";
      };

      ui = {
        "default-command" = [
          "log"
          "--limit=10"
          "-T"
          "builtin_log_comfortable"
        ];
        pager = "delta";
      };

      "merge-tools" = {
        difft."diff-args" = [
          "--color=always"
          "--missing-as-empty"
          "$left"
          "$right"
        ];
        difftu = {
          program = "difft";
          "diff-args" = [
            "--color=always"
            "--display=inline"
            "--missing-as-empty"
            "$left"
            "$right"
          ];
        };
      };

      aliases = {
        l = [
          "log"
          "--limit=25"
          "-T"
          "builtin_log_comfortable"
          "-r"
          "(main..@) | (main..@)-"
        ];
        la = [
          "log"
          "--limit=25"
          "-T"
          "builtin_log_oneline"
          "-r"
          "all()"
        ];
        d = [
          "diff"
          "--tool=difftu"
        ];
        dd = [
          "diff"
          "--git"
        ];
        ds = [
          "diff"
          "--tool=difft"
        ];
        s = [
          "show"
          "--tool=difftu"
        ];
        ss = [
          "show"
          "--tool=difft"
        ];
      };

      "revset-aliases" = {
        # Prevent rewriting commits on main@origin and commits authored by other users;
        "user(x)" = "author(x) | committer(x)";
        "trunk()" = "latest((present(main) | present(master)) & remote_bookmarks())";
        "open" = "(mine() ~ ::trunk()) ~ heads(empty())";
        "wip" = ''description("wip: ")'';
        "ready" = "open() ~ (wip::)";
      };

      colors =
        let
          bold = {
            bold = true;
          };
          dim = {
            fg = "bright black";
          };
          underline = {
            fg = "default";
            underline = true;
          };
        in
        {
          "error" = bold;
          "warning" = bold;
          "error heading" = bold;
          "error_source heading" = bold;
          "warning heading" = bold;
          "hint heading" = bold;
          "prefix" = bold;
          "rest" = "bright black";
          "divergent prefix" = underline;
          "bookmark" = "magenta";
          "bookmarks" = "magenta";
          "change_id" = "magenta";
          "local_bookmarks" = "magenta";

          "diff file_header" = bold;
          "diff hunk_header" = "cyan";
          "diff removed" = "red";
          "diff removed token" = "red";
          "diff added" = "green";
          "diff added token" = "green";
          "diff modified" = "cyan";
          "diff untracked" = "magenta";
          "diff renamed" = "cyan";
          "diff copied" = "green";
          "diff access-denied" = {
            bg = "red";
          };

          "elided" = "blue";
          "node elided" = dim;
          "node working_copy" = {
            fg = "green";
            bold = true;
          };
          "node current_operation" = bold;
          "node immutable" = bold;
          "node conflict" = {
            fg = "red";
            bold = true;
          };
          "operation id" = "blue";
          "operation current_operation" = bold;
          "remote_bookmarks" = "magenta";
          "working_copy" = {
            fg = "green";
            bold = true;
          };
          "working_copy change_id" = "magenta";
          "working_copy description placeholder" = "green";
          "working_copy empty description placeholder" = "green";
          "working_copy bookmark" = "bright magenta";
          "working_copy bookmarks" = "bright magenta";
          "working_copy local_bookmarks" = "bright magenta";
          "working_copy remote_bookmarks" = "bright magenta";
        }
        // lib.genAttrs [
          "author"
          "branch"
          "branches"
          "commit_id"
          "committer"
          "config_list name"
          "config_list overridden"
          "config_list overridden name"
          "config_list overridden value"
          "config_list value"
          "conflict"
          "conflict_description"
          "conflict_description difficult"
          "description placeholder"
          "diff token"
          "divergent"
          "divergent change_id"
          "divergent rest"
          "empty"
          "empty description placeholder"
          "error_source"
          "git_head"
          "git_refs"
          "hidden prefix"
          "hint"
          "local_branches"
          "operation current_operation id"
          "operation current_operation time"
          "operation current_operation user"
          "operation time"
          "operation user"
          "placeholder"
          "remote_branches"
          "root"
          "separator"
          "tag"
          "tags"
          "timestamp"
          "working_copies"
          "working_copy author"
          "working_copy branch"
          "working_copy branches"
          "working_copy commit_id"
          "working_copy committer"
          "working_copy conflict"
          "working_copy divergent"
          "working_copy divergent change_id"
          "working_copy empty"
          "working_copy git_refs"
          "working_copy local_branches"
          "working_copy placeholder"
          "working_copy remote_branches"
          "working_copy tag"
          "working_copy tags"
          "working_copy timestamp"
          "working_copy working_copies"
        ] (_: "default");

    };
  };
}
