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

variable "matchbox_http_endpoint" {
  type        = string
  description = "address of matchbox server where ignition configs will be provided. this must be the HTTP endpoint, not the GRPC one."
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