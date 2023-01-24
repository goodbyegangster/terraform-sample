resource "google_compute_instance" "sftp_server" {
  project                     = var.PROJECT_NAME

  machine_type              = "e2-micro"
  name                      = "sftp-server"
  zone                      = "asia-northeast1-a"
  allow_stopping_for_update = true
  description               = "sftp server"
  deletion_protection       = false

  boot_disk {
    auto_delete = true
    mode        = "READ_WRITE"
    initialize_params {
      size  = 10
      type  = "pd-balanced"
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
      labels = {
        env = "sftp-server"
      }
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.network_public_sftp.id
    access_config {}
  }

  service_account {
    email  = google_service_account.sftp_server.email
    scopes = ["cloud-platform"]
  }

  metadata = {
    user-data = file("./cloud-init.yaml"),
  }

  labels = {
    env = "sftp-server"
  }

  tags = ["sftp-server"]
}
