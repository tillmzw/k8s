
variable "proxmox_target_node" {
  type        = string
  default     = "pve"
  description = "hostname of the proxmox node to provision on"
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


variable "node_fcos_version" {
  type        = string
  description = "FCOS version to provision via matchbox on nodes"
}

variable "controller_number" {
  type        = number
  description = "number of controlplane nodes"
  default     = 1
}

variable "controller_cpus" {
  type        = number
  description = "number of vCPUs to assign to control plane VMs"
  default     = 2
}

variable "controller_memory" {
  type        = number
  description = "amount of RAM in MB to assign to control plane VMs. This needs to hold at least an unpacked FCOS install disk"
  default     = 3096
}

variable "worker_number" {
  type        = number
  description = "number of worker nodes"
  default     = 1
}

variable "worker_cpus" {
  type        = number
  description = "number of vCPUs to assign to worker VMs"
  default     = 2
}

variable "worker_memory" {
  type        = number
  description = "amount of RAM in MB to assign to worker VMs. This needs to hold at least an unpacked FCOS install disk"
  default     = 3096
}

variable "cluster_name" {
  type = string
}

variable "cluster_api_address" {
  type        = string
  description = "address (IP or DNS) under which the control plane will be reachable"
}

variable "node_domain" {
  type        = string
  description = "domain part appended to node hostnames for a FQDN"
}