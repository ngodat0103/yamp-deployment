output "master-nodes-public-ip" {
  description = "Public IP of master nodes"
  value       = google_compute_instance.k8s-master-instances[*].network_interface[*].access_config[*].nat_ip
}
output "worker-nodes-public-ip" {
  description = "Public IP of worker nodes"
  value       = google_compute_instance.k8s-worker-instances[*].network_interface[*].access_config[*].nat_ip
}
output "master-instances" {
  description = "master-instances"
  value       =  google_compute_instance.k8s-master-instances[*].self_link
}

# output "worker-instances-group" {
#   description = "Instance group of worker nodes"
#   value       = google_compute_instance_group.k8s-worker-instances-group.self_link
# }