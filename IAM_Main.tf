resource "google_Service_account" "cw" {account_id   = "cw"}

resource "google_Service_account" "ig" {account_id   = "ig"}

resource "google_project_iam_member" "cw_bq_editor" {
    project = var.project_id
    role    = "roles/bigquery.dataEditor"
    member  = "serviceAccount:${google_service_account.cw.email}"
}

resource "google_project_iam_member" "human_access" {
    for_each = toset([
        "aarushi.a.sharma@capgemini.com", 
         "amol.talap@capgemini.com"]) 
    project = var.project_id
    role    = "roles/viewer"
    member  = "user:${each.value}"

}




