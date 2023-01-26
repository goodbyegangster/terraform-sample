# /******************************************
#   Secret Manager - Secret
#  *****************************************/
resource "google_secret_manager_secret" "secret" {
  project   = var.PROJECT_NAME
  secret_id = "sftp-server"

  replication {
    user_managed {
      replicas {
        location = "asia-northeast1"
      }
    }
  }

  labels = {
    env = "sftp-server"
  }
}
