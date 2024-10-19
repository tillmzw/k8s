resource "proxmox_lxc" "matchbox" {
  # depends_on = [
  # proxmox_lxc.dnsmasq # need to wait for dhcp
  # ]
  target_node     = var.target_node
  hostname        = "matchbox"
  ostemplate      = var.container_template_name
  password        = var.container_root_password
  unprivileged    = true
  ssh_public_keys = join("\n", var.ssh_public_keys)
  cores           = 1
  memory          = 256
  start           = true

  rootfs {
    storage = "local-lvm"
    size    = "2G"
  }

  network {
    name   = "eth0"
    bridge = "vmbr0"
    ip     = "10.0.0.12/24"
  }

  provisioner "remote-exec" {
    inline = [
      "mkdir -p /etc/matchbox"
    ]
  }

  provisioner "file" {
    content     = tls_self_signed_cert.matchbox_ca.cert_pem
    destination = "/etc/matchbox/ca.crt"
  }

  provisioner "file" {
    content     = tls_locally_signed_cert.matchbox.cert_pem
    destination = "/etc/matchbox/server.crt"
  }

  provisioner "file" {
    content     = tls_private_key.matchbox.private_key_pem
    destination = "/etc/matchbox/server.key"
  }

  provisioner "remote-exec" {
    script = "${path.module}/scripts/matchbox_setup.sh"
  }

  connection {
    type        = "ssh"
    agent       = false
    host        = split("/", self.network[0].ip)[0]
    user        = "root"
    private_key = file(var.ssh_private_key_path)
    timeout     = "120s"
  }
}
