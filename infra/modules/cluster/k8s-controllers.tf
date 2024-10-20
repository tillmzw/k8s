
resource "proxmox_vm_qemu" "controllers" {
  count       = var.controller_number
  name        = "ctrl${count.index + 1}"
  target_node = var.target_node

  boot  = "order=sata0;sata1"
  agent = 0

  cores  = var.controller_cpus
  memory = var.controller_memory

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