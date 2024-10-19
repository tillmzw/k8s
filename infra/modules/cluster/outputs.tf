resource "local_file" "kubeconfig-lab" {
  content         = module.lab.kubeconfig-admin
  filename        = "lab-config"
  file_permission = "0600"
}