output "master-nodes-public-ip" {
  description = "Public IP of master nodes"
  value       = module.instances.master-nodes-public-ip
}
output "worker-nodes-public-ip" {
  description = "Public IP of worker nodes"
  value       = module.instances.worker-nodes-public-ip
}
output "internal-lb-ip" {
  description = "Internal LB IP"
  value       = module.master-nodes-internal-lb.internal-lb-ip
}