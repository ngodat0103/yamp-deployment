resource "google_compute_address" "master-nodes-internal-lb-ip" {
  name         = "k8s-master-internal-lb-ip"
  region       = var.region
  address_type = "INTERNAL"
  subnetwork   = var.subnetwork
}
module "network_ilb" {
  source  = "GoogleCloudPlatform/lb-internal/google"
  version = "~> 7.0"
  ip_address =  google_compute_address.master-nodes-internal-lb-ip.address
  project      = var.project_id
  network      = var.network
  subnetwork   = var.subnetwork
  region       = var.region
  name         =  var.name
  ports        = var.ports 
  source_tags  = var.source_tags
  target_tags  = var.target_tags
  backends     = var.backend_services
  health_check = var.health_check
}