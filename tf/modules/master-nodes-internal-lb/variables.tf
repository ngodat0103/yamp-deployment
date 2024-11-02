variable "name" {
  description = "Name of the master load balancer"
  type        = string
  default    = "k8s-master-nodes-lb"
}
variable "subnetwork" {
  description = "Subnetwork for the master load balancer"
  type        = string
  default   = "k8s-master-nodes-subnet"
}
variable "region" {
  description = "Region for the master load balancer"
  type        = string
}
variable "project_id" {
  description = "The project ID"
  type        = string
}
variable "network" {
  description = "The network"
  type        = string
  default   = "k8s-network"
}

variable "source_tags" {
  type = list(string)
  description = ""
  default = ["master-nodes"]
}
variable "target_tags" {
  type = list(string)
  description = ""
  default = ["worker-nodes"]
}
variable "ports" {
  type = list(number)
  description = "The port for K8s API server"
  default = [6443]
}
variable "health_check" {
  type = map(string)
  description = "The health check configuration"
  default = {
    type                = "http"
    check_interval_sec  = 1
    healthy_threshold   = 4
    timeout_sec         = 1
    unhealthy_threshold = 5
    proxy_header        = "NONE"
    port                = 6443
    port_name           = "master-nodes-api-server-port"
    request             = ""
    request_path        = "/livez"
    host                = ""
    enable_log = false
  }
}
variable "backend_services" { 
  type = list(object({
    group = string
    balancing_mode = string
  }))
}