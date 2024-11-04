variable "project_id" {
  description = "The project ID to deploy into"
  type        = string
  # default = "nt531-438806"
}

variable "network_name" {
  description = "The name of the network"
  type        = string
  default     = "k8s-network"
}
variable "master-nodes-subnet" {
  description = "The name of the subnet for master nodes"
  type        = string
  default     = "k8s-master-nodes-subnet"
}
variable "worker-nodes-subnet" {
  description = "The name of the subnet for worker nodes"
  type        = string
  default     = "k8s-worker-nodes-subnet"
}


variable "master-nodes-region" {
  description = "The region for master nodes"
  type        = string
  default     = "asia-southeast1"
}
variable "worker-nodes-region" {
  description = "The region for worker nodes"
  type        = string
  default     = "asia-southeast2"
}
variable "n_master_nodes" {
  description = "Number of instances for master nodes"
  type        = number
  default     = 2
}
variable "n_worker_nodes" {
  description = "Number of instances for worker nodes"
  type        = number
  default     = 4
}
variable "machine_type" {
  description = "Machine type for instances"
  type        = string
  default     = "e2-medium"
}
variable "master-nodes-zone" {
  description = "Zone for instances"
  type        = string
  default     = "asia-southeast1-a"
}
variable "worker-nodes-zone" {
  description = "Zone for instances"
  type        = string
  default     = "asia-southeast2-a"
}
variable "environment" {
  description = "Environment for instances"
  type        = string
  default     = "dev"
} 