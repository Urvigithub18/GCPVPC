variable "name" 
{
    description = "TestVPC"
    type        = "string"
}

variable "project" 
{
    description = "My First Project"
    type        = "string"
}

variable "automatic_create_subnetworks" {
    description = "If set to true, this network will be created in auto subnet mode, and Google will create a subnet for each region automatically. If set to false, a custom subnetted network will be created that can support google_compute_subnetwork resources."
    type        = "string"
    default     = "true"
}

variable "routing_mode" {
    description = "Sets the network-wide routing mode for Cloud Routers to use. Accepted values are GLOBAL or REGIONAL."
    type        = "string"
    default     = "GLOBAL"
}
