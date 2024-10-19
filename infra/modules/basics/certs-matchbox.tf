# --- CA ---
# TODO: taint matchbox container if this changes
resource "tls_private_key" "matchbox_ca" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "tls_self_signed_cert" "matchbox_ca" {
  private_key_pem = tls_private_key.matchbox_ca.private_key_pem

  validity_period_hours = 87600 # 10 years

  is_ca_certificate = true
  allowed_uses = [
    "cert_signing",
    "crl_signing",
    "key_encipherment",
    "digital_signature",
  ]

  subject {
    common_name  = "matchbox CA"
    organization = "local Inc."
  }
}

# --- Server ---
resource "tls_private_key" "matchbox" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "tls_cert_request" "matchbox" {
  private_key_pem = tls_private_key.matchbox.private_key_pem
  dns_names = [
    "matchbox",
    "matchbox.pve.local",
  ]
  ip_addresses = [
    "10.0.0.12"
  ]
  subject {
    common_name  = "matchbox server"
    organization = "local Inc."
  }
}

resource "tls_locally_signed_cert" "matchbox" {
  cert_request_pem   = tls_cert_request.matchbox.cert_request_pem
  ca_private_key_pem = tls_private_key.matchbox_ca.private_key_pem
  ca_cert_pem        = tls_self_signed_cert.matchbox_ca.cert_pem

  validity_period_hours = 87600 # 10 years

  allowed_uses = [
    "key_encipherment",
    "digital_signature",
    "server_auth",
  ]
}

# --- Client ---
resource "tls_private_key" "matchbox_client" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "tls_cert_request" "matchbox_client" {
  private_key_pem = tls_private_key.matchbox_client.private_key_pem
  dns_names       = []
  subject {
    common_name  = "matchbox client"
    organization = "local Inc."
  }
}

resource "tls_locally_signed_cert" "matchbox_client" {
  cert_request_pem   = tls_cert_request.matchbox_client.cert_request_pem
  ca_private_key_pem = tls_private_key.matchbox_ca.private_key_pem
  ca_cert_pem        = tls_self_signed_cert.matchbox_ca.cert_pem

  validity_period_hours = 87600 # 10 years

  allowed_uses = [
    "client_auth",
  ]
}
