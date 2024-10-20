resource "local_file" "kubeconfig" {
  content         = module.cluster.kubeconfig-admin
  filename        = "cluster-kubeconfig"
  file_permission = "0600"
}