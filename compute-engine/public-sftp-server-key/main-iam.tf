# /******************************************
#   Service Account
#  *****************************************/
resource "google_service_account" "sftp_server" {
  project      = var.PROJECT_NAME

  account_id   = "sftp-server"
  display_name = "SFTP Server"
}
