variable "proxmox_api_url" {
  type = string
}

variable "proxmox_api_token_id" {
  type      = string
  sensitive = true
}

variable "proxmox_api_token_secret" {
  type      = string
  sensitive = true
}

variable "target_node" {
  type        = string
  description = "target proxmox node"
  default     = "box"
}

variable "container_template_name" {
  type        = string
  description = "container template used to provision basic LXC containers."
}


variable "container_root_password" {
  type        = string
  description = "root account password"
  sensitive   = true
}

variable "ssh_private_key_path" {
  type        = string
  description = "path to your private ssh key, used for connections to containers"
}

variable "ssh_public_keys" {
  type    = list(string)
  default = []
}
