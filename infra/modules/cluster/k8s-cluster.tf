module "cluster" {
  source = "git::https://github.com/poseidon/typhoon//bare-metal/fedora-coreos/kubernetes?ref=v1.31.1"

  cluster_name           = var.cluster_name
  matchbox_http_endpoint = var.matchbox_http_endpoint
  os_stream              = "stable"
  os_version             = var.node_fcos_version

  k8s_domain_name    = var.cluster_api_address
  ssh_authorized_key = var.ssh_authorized_key

  controllers = [for vm in proxmox_vm_qemu.controllers : {
    name   = vm.name
    mac    = lower(vm.network[0].macaddr)
    domain = "${vm.name}.${var.node_domain}"
  }]
  workers = [for vm in proxmox_vm_qemu.workers : {
    name   = vm.name,
    mac    = lower(vm.network[0].macaddr)
    domain = "${vm.name}.${var.node_domain}"
  }]
}