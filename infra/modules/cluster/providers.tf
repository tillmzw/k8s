terraform {
  required_version = ">= 1.9.6"
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "3.0.1-rc4"
    }
    ct = {
      source  = "poseidon/ct"
      version = ">= 0.13.0"
    }
    matchbox = {
      source  = "poseidon/matchbox"
      version = ">= 0.5.2"
    }
  }
}

provider "proxmox" {
  pm_api_url          = var.proxmox_api_url
  pm_api_token_id     = var.proxmox_api_token_id
  pm_api_token_secret = var.proxmox_api_token_secret
  pm_tls_insecure     = true
}

provider "matchbox" {
  endpoint    = "10.0.0.12:8081"
  client_cert = var.matchbox_client_crt.cert_pem
  client_key  = var.matchbox_client_key.private_key_pem
  ca          = var.matchbox_ca_crt.cert_pem
}
