# keepalived helm chart
This repository contains a helm chart to deploy keepalived on kubernetes. This allows you to setup a VIP for a HA cluster, without having to configure keepalived on every node.

# Usage
- Create `values.local.yaml` or edit `values.yaml` and put your specific cluster configuration in it. Example:
```yaml
config:
  virtualRouterId: 50
  interface: eno1
  password: securepassword
  virtualIpAddress: 192.168.1.100 # Put your VIP here

# nodes that can be the VIP. targets all master nodes if empty
targetNodes:
  - node1
  - node2
  - node3
```
- Run `helmfile sync` to apply to your cluster
- Done !

The only external dependency you need is an image with `keepalived` installed. You can use the one provided in this repository (`ghcr.io/itrooz/keepalived:latest`), but in case the repository is not updated in a while, you can also bring your own.
