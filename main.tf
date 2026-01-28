terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "7.17.0"
    }
  }
}

provider "google" {
  # Configuration options
}

resource "google_storage_bucket" "no-public-access" {
  name          = "no-public-access-bucket"
  location      = "US"
  force_destroy = true

  public_access_prevention = "enforced"
}