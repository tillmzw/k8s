
resource "proxmox_vm_qemu" "workers" {
  for_each    = toset(["work1"])
  name        = each.key
  target_node = "box"

  boot  = "order=sata0;sata1"
  agent = 0

  cores  = 2
  memory = 3072

  vm_state = "started"

  disks {
    sata {
      sata0 {
        disk {
          size    = "100G"
          storage = "local-lvm"
        }
      }
      sata1 {
        cdrom {
          iso = "local:iso/https-ipxe.iso"
        }
      }
    }
  }

  network {
    bridge    = "vmbr0"
    firewall  = false
    link_down = false
    model     = "e1000"
  }
}