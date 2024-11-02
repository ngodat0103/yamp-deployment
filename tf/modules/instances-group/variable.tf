variable "master-nodes-zone" {
    description = "Zone for master nodes"
    type        = string
    default    = "asia-southeast1-a"
}
variable "network" {
    description = "Network for the cluster"
    type        = string
    default    = "k8s-network"
}
variable "instances" {
    description = "Instances for the group"
    type        = list(string)
}


variable "worker-nodes-zone" {
    description = "Zone for worker nodes"
    type        = string
    default    = "asia-southeast1-a"
} 
variable "worker-nodes-region" {
    description = "Region for worker nodes"
    type        = string
    default    = "asia-southeast1"
} 
variable "master-nodes-backend-service" {
    description = "Backend service for master nodes"
    type        = list(map(string))
    default = [
        {
            name = "k8s-master-backend-service"
            timeout_sec = 3
            port_name = "http"
            protocol = "HTTP"
            health_check = "k8s-master-health-check"
            load_balancer_mode = "CONNECTION"
        }
    ]
}