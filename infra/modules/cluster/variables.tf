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

variable "ssh_authorized_key" {
  type = string
}

variable "controller_names" {
  type    = list(string)
  default = []
}

variable "worker_names" {
  type    = list(string)
  default = []
}

variable "matchbox_ca_crt" {
  type      = any
  sensitive = true
}

variable "matchbox_client_key" {
  type      = any
  sensitive = true
}

variable "matchbox_client_crt" {
  type      = any
  sensitive = true
}