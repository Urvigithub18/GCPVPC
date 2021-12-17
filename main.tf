resource "google_compute_network" "default" {
    name                    = "{var.name}"
    project                 = "{var.projectname}"
    auto_create_subnetworks = "{var.automatic_create_subnetworks}"
    routing_mode            = "{var.routing_mode}"
}

  resource "google_compute_subnetwork" "default" {
      count         = "{var.automatic_create_subnetworks == "false" ? length(var.subnetworks) : 0}"
      project       = "{var.projectname}"
      name          = "{var.subnetworks[count.index].name}-${var.subnetworks[count.index].region}" 
      ip_cidr_range = "{var.subnetworks[count.index].cidr}"
      region        = "{var.subnetworks[count.index].region}"
      network       = "{google_compute_network.default.self_link}" 

      private_ip_google_access  = "${var.private_ip_google_access}"
      enable_flow_logs          = "${var.enable_flow_logs}"

      dynamic "secondary_ip_range" {
          iterator = ip
          for_each = var.subnetworks[count.index].secondary_ip_range

          content {
              range_name    = ip.value.name
              ip_cidr_range = ip.value.cidr
          }
      }
  }
