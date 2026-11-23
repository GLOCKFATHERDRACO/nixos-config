{inputs}: let
  # -- definitions
  available = {
    proton-cachyos = inputs.nix-gaming-edge.overlays.proton-cachyos;
  };

  # -- toggles
  enabled = [
    "proton-cachyos"
  ];
in
  map (name: available.${name}) enabled
