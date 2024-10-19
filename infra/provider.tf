terraform {
  required_version = ">= 1.9.6"
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "3.0.1-rc4"
    }
  }
}

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

variable "container_root_password" {
  type      = string
  sensitive = true
}

variable "container_template_name" {
  type = string
}

variable "ssh_private_key_path" {
  type = string
}

variable "ssh_public_keys" {
  type    = list(string)
  default = []
}

provider "proxmox" {
  pm_api_url          = var.proxmox_api_url
  pm_api_token_id     = var.proxmox_api_token_id
  pm_api_token_secret = var.proxmox_api_token_secret
  pm_tls_insecure     = true
}
