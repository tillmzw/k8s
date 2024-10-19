module "lab" {
  source = "git::https://github.com/poseidon/typhoon//bare-metal/fedora-coreos/kubernetes?ref=v1.31.1"

  # bare-metal
  cluster_name           = "lab"
  matchbox_http_endpoint = "http://10.0.0.12:8080"
  os_stream              = "stable"
  os_version             = "40.20240920.3.0"

  # configuration
  k8s_domain_name    = "lab.512.ch"
  ssh_authorized_key = var.ssh_authorized_key

  # TODO: properly loop over controllers & workers
  controllers = [{
    name   = "ctrl1"
    mac    = lower(proxmox_vm_qemu.controllers["ctrl1"].network[0].macaddr)
    domain = "ctrl1.fritz.box"
  }]
  workers = [
    {
      name   = "work1",
      mac    = lower(proxmox_vm_qemu.workers["work1"].network[0].macaddr)
      domain = "work1.fritz.box"
    }
  ]
}