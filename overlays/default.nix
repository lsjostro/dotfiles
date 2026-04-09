{ ... }:

final: prev: {
  kagi-mcp-server = (import ./kagi-mcp-server.nix final prev).kagi-mcp-server;
  gerrit-mcp-server = (import ./gerrit-mcp-server.nix final prev).gerrit-mcp-server;
}
