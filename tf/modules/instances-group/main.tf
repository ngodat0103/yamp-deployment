resource "google_compute_instance_group" "master-instances-group" {
    name = "k8s-master-instances-group"
    description = "Instance group of master nodes"
    zone = var.master-nodes-zone
    network = var.network
    instances = var.instances

}