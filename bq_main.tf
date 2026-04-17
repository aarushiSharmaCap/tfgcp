resource "google_bigquery_dataset" "datasets" {
for_each = toset(["audit_logging", "dlp_scan", "my_data"])

dataset_id = each.value
location   = "US"
}

resource "google_bigquery_dataset_iam_member" "ig_audit" {
    dataset_id = google_bigquery_dataset.datasets["audit_logging"].dataset_id
    role       = "roles/bigquery.dataViewer"
    member     = "serviceAccount:${google_service_account.ig.email}"
}

resource "google_bigquery_dataset_iam_member" "cw_dlp_mydate" {
    for_each = toset(["dlp_scan", "my_data"])
    dataset_id = google_bigquery_dataset.datasets[each.value].dataset_id
    role       = "roles/bigquery.dataEditor"
    member     = "serviceAccount:${google_service_account.cw.email}"
}