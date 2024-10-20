module "basics" {
  source = "./modules/basics"

  target_node              = var.proxmox_target_node
  proxmox_api_url          = "https://${var.proxmox_target_node}:8006/api2/json"
  proxmox_api_token_id     = var.proxmox_api_token_id
  proxmox_api_token_secret = var.proxmox_api_token_secret

  container_root_password = var.container_root_password
  container_template_name = var.container_template_name

  ssh_private_key_path = var.ssh_private_key_path
  ssh_public_keys      = var.ssh_public_keys
}

module "cluster" {
  source = "./modules/cluster"

  target_node              = var.proxmox_target_node
  proxmox_api_url          = "https://${var.proxmox_target_node}:8006/api2/json"
  proxmox_api_token_id     = var.proxmox_api_token_id
  proxmox_api_token_secret = var.proxmox_api_token_secret

  ssh_authorized_key     = var.ssh_public_keys[0]
  matchbox_ca_crt        = module.basics.matchbox_ca_crt
  matchbox_client_key    = module.basics.matchbox_client_key
  matchbox_client_crt    = module.basics.matchbox_client_crt
  matchbox_http_endpoint = "http://10.0.0.12:8080"

  controller_number = var.controller_number
  controller_cpus   = var.controller_cpus
  controller_memory = var.controller_memory

  worker_number       = var.worker_number
  worker_cpus         = var.worker_cpus
  worker_memory       = var.worker_memory
  cluster_name        = var.cluster_name
  cluster_api_address = var.cluster_api_address
  node_domain         = var.node_domain
  node_fcos_version   = var.node_fcos_version
}