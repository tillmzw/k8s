output "matchbox_ca_crt_pem" {
  value     = module.basics.matchbox_ca_crt.cert_pem
  sensitive = true
}

output "matchbox_client_key_pem" {
  value     = module.basics.matchbox_client_key.private_key_pem
  sensitive = true
}

output "matchbox_client_crt_pem" {
  value     = module.basics.matchbox_client_crt.cert_pem
  sensitive = true
}