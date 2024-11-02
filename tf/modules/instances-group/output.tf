output "instances-group" {
  description = "Instance group of master nodes"
  value       = google_compute_instance_group.master-instances-group.self_link 
}