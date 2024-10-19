module "basics" {
  source = "./modules/basics"

  proxmox_api_url          = var.proxmox_api_url
  proxmox_api_token_id     = var.proxmox_api_token_id
  proxmox_api_token_secret = var.proxmox_api_token_secret
  target_node              = "box"

  container_root_password = var.container_root_password
  container_template_name = var.container_template_name

  ssh_private_key_path = var.ssh_private_key_path
  ssh_public_keys      = var.ssh_public_keys
}

module "cluster" {
  source = "./modules/cluster"

  proxmox_api_url          = var.proxmox_api_url
  proxmox_api_token_id     = var.proxmox_api_token_id
  proxmox_api_token_secret = var.proxmox_api_token_secret
  target_node              = "box"

  controller_names = ["ctrl1"]
  worker_names     = ["work1"]

  ssh_authorized_key  = var.ssh_public_keys[0]
  matchbox_ca_crt     = module.basics.matchbox_ca_crt
  matchbox_client_key = module.basics.matchbox_client_key
  matchbox_client_crt = module.basics.matchbox_client_crt
}