{ ... }:
{
  homebrew = {
    brews = [ ];
    casks =
      map
        (app: {
          name = app;
          args = {
            appdir = "/Applications";
            require_sha = true;
          };
        })
        [
          # Programs that I want to stay more up-to-date than what's in nixpkgs
          "kitty"
          "secretive"
        ];

    # Don't really care about idempotency for these. If I eventually do, will
    # move them into Nix packages instead.
    onActivation.autoUpdate = true;
    onActivation.upgrade = true;
    onActivation.cleanup = "zap";
  };
}
