# Setup

Fresh install from the NixOS installer ISO

```
sudo nix --extra-experimental-features "nix-command flakes" run github:nix-community/disko/latest -- --mode destroy,format,mount --flake 'github:glockfatherdraco/nixos-config#host' && sudo nixos-install --flake 'github:glockfatherdraco/nixos-config#host'
```

# Re enrol keys into tpm

```
sudo systemd-cryptenroll --wipe-slot=tpm2 --tpm2-device=auto --tpm2-pcrlock=/var/lib/systemd/pcrlock.json /dev/nvme0n1p2
```
