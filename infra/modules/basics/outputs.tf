output "matchbox_ca_crt" {
  value     = tls_self_signed_cert.matchbox_ca
  sensitive = true
}

output "matchbox_client_key" {
  value     = tls_private_key.matchbox_client
  sensitive = true
}

output "matchbox_client_crt" {
  value     = tls_locally_signed_cert.matchbox_client
  sensitive = true
}