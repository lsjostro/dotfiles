{
  config,
  pkgs,
  lib,
  ...
}:
{
  home.packages = with pkgs; [
    comma
    doggo
    file
    just
    nix-output-monitor
  ];
  age.secrets.kagi_api_key.file = ../../secrets/kagi_api_key.age;
  age.secrets.gerrit_mcp_config.file = ../../secrets/gerrit_mcp_config.age;

  programs.claude-code = {
    enable = true;
    enableMcpIntegration = true;
    lspServers = {
      nix = {
        command = lib.getExe pkgs.nixd;
        extensionToLanguage = {
          ".nix" = "nix";
        };
      };
      go = {
        command = lib.getExe pkgs.gopls;
        args = [ "serve" ];
        extensionToLanguage = {
          ".go" = "go";
        };
      };
      typescript = {
        command = lib.getExe pkgs.typescript-language-server;
        args = [ "--stdio" ];
        extensionToLanguage = {
          ".ts" = "typescript";
          ".tsx" = "typescriptreact";
          ".js" = "javascript";
          ".jsx" = "javascriptreact";
        };
      };
      rust = {
        command = lib.getExe pkgs.rust-analyzer;
        extensionToLanguage = {
          ".rs" = "rust";
        };
      };
    };
    mcpServers = {
      # devenv.sh
      devenv = {
        type = "stdio";
        command = lib.getExe pkgs.devenv;
        args = [ "mcp" ];
      };
      # Gerrit Code Review
      gerrit = {
        type = "stdio";
        command = lib.getExe pkgs.gerrit-mcp-server;
        env.GERRIT_CONFIG_PATH = config.age.secrets.gerrit_mcp_config.path;
        args = [ "stdio" ];
      };
      # Kagi Search API
      kagi = {
        type = "stdio";
        env.KAGI_API_KEY_FILE = config.age.secrets.kagi_api_key.path;
        command = lib.getExe pkgs.kagi-mcp-server;
      };
      # Linear project mgmt
      linear = {
        type = "http";
        url = "https://mcp.linear.app/mcp";
      };
    };

    rules = {
      version-control = ''
        # Version Control

        Use jujutsu (`jj`) instead of `git` for all version control operations. This includes:
        - Checking status and history
        - Creating and managing commits/changes
        - Diffing
        - Rebasing and squashing
        - Managing branches/bookmarks

        Only use `git` when a tool strictly requires it and has no `jj` equivalent (e.g., `gh` CLI for GitHub API operations).
      '';

      code-style = ''
        # Code Style Guidelines

        - Use consistent formatting
        - Follow language conventions
        - Comment heavily — explain why, not just what
        - Use plain comments - Do not use decorative separator comments with dashes or box-drawing characters
      '';

      testing = ''
        # Testing Conventions

        - Write tests for all new features
        - Maintain test coverage above 80%
      '';
    };

    settings = {
      env = {
        DISABLE_TELEMETRY = lib.mkForce "1";
        CLAUDE_CODE_ENABLE_TELEMETRY = lib.mkForce "0";
      };
      includeCoAuthoredBy = false;
      permissions.allow = [
        # Jujutsu
        "Bash(jj diff:*)"
        "Bash(jj log:*)"
        "Bash(jj show:*)"
        "Bash(jj status:*)"

        # Gerrit
        "mcp__plugin_claude-code-home-manager_gerrit__get_file_diff"
        "mcp__plugin_claude-code-home-manager_gerrit__list_change_files"
        "mcp__plugin_claude-code-home-manager_gerrit__post_review_comment"
        "mcp__plugin_claude-code-home-manager_gerrit__query_changes"

        # GitHub
        "Bash(gh api:*)"
        "Bash(gh search issues:*)"
        "Bash(gh search prs:*)"
        "Bash(gh search code:*)"
        "WebFetch(domain:api.github.com)"
        "WebFetch(domain:github.com)"
        "WebFetch(domain:raw.githubusercontent.com)"

        # Kagi
        "mcp__plugin_claude-code-home-manager_kagi__kagi_search_fetch"

        # Linear
        "mcp__plugin_claude-code-home-manager_linear__get_document"
        "mcp__plugin_claude-code-home-manager_linear__get_issue"
        "mcp__plugin_claude-code-home-manager_linear__get_issue_status"
        "mcp__plugin_claude-code-home-manager_linear__get_project"
        "mcp__plugin_claude-code-home-manager_linear__get_team"
        "mcp__plugin_claude-code-home-manager_linear__get_user"
        "mcp__plugin_claude-code-home-manager_linear__list_comments"
        "mcp__plugin_claude-code-home-manager_linear__list_cycles"
        "mcp__plugin_claude-code-home-manager_linear__list_documents"
        "mcp__plugin_claude-code-home-manager_linear__list_issue_labels"
        "mcp__plugin_claude-code-home-manager_linear__list_issue_statuses"
        "mcp__plugin_claude-code-home-manager_linear__list_issues"
        "mcp__plugin_claude-code-home-manager_linear__list_my_issues"
        "mcp__plugin_claude-code-home-manager_linear__list_project_labels"
        "mcp__plugin_claude-code-home-manager_linear__list_projects"
        "mcp__plugin_claude-code-home-manager_linear__list_teams"
        "mcp__plugin_claude-code-home-manager_linear__list_users"
        "mcp__plugin_claude-code-home-manager_linear__search_documentation"
      ];
      permissions.deny = [
        "WebSearch" # We use Kagi
      ];
    };
  };

  home.sessionVariables.COLORTERM = "truecolor";
}
