{
  environment.sessionVariables = {
    # -- force electron apps to run natively under wayland
    NIXOS_OZONE_WL = "1";
  };
}
