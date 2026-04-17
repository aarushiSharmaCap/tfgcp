resource "google_storage_bucket" "ingress" {
    name     = "ingress_${var.project_id}"
    location = "US"
}

resource "google_storage_bucket" "egress" {
    name     = "egress_${var.project_id}"
    location = "US"
}

resource "google_storage_bucket_iam_member" "ig_object_user" {
    bucket = google_storage_bucket.ingress.name
    role   = "roles/storage.objectUser"
    member = "serviceAccount:${google_service_account.ig.email}"
}
