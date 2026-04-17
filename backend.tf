terraform {
backend "gcs" {
  bucket  = "tf-state-bucket"
  prefix  = "state/${var.project_id}"
}
}