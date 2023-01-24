# /******************************************
#   VPC
#  *****************************************/
resource "google_compute_network" "vpc_public_sftp_server" {
  project                         = var.PROJECT_NAME

  name                            = "vpc-public-sftp-server"
  description                     = "for public sftp server"
  auto_create_subnetworks         = false
  routing_mode                    = "GLOBAL"
  mtu                             = 1460
  delete_default_routes_on_create = false
}

# /******************************************
# Subnet
#  *****************************************/
resource "google_compute_subnetwork" "network_public_sftp" {
  project                     = var.PROJECT_NAME

  ip_cidr_range               = "192.168.0.0/24"
  name                        = "network-public-sftp-server"
  network                     = google_compute_network.vpc_public_sftp_server.id
  description                 = "for public sftp server"
  private_ip_google_access    = false
  region                      = "asia-northeast1"
}

# /******************************************
# Firewall
#  *****************************************/
resource "google_compute_firewall" "firewall" {
  project       = var.PROJECT_NAME

  name          = "allow-ssh"
  allow {
    ports    = ["22"]
    protocol = "tcp"
  }
  direction     = "INGRESS"
  network       = google_compute_network.vpc_public_sftp_server.id
  priority      = 1000
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["sftp-server"]
}
