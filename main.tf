terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "7.17.0"
    }
  }
}

provider "google" {
  project = "cloudops-479805"
}

resource "google_storage_bucket" "no-public-access" {
  name          = "cloudbuild-bucket"
  location      = "US"
  force_destroy = true

  public_access_prevention = "enforced"
}