{
  ...
}:
{
  home.file = {
    ".local/bin" = {
      recursive = true;
      source = ./../../files/scripts;
    };

  };

  home.sessionVariables = {
    SSH_AUTH_SOCK = "$XDG_RUNTIME_DIR/gcr/ssh";
  };
}
