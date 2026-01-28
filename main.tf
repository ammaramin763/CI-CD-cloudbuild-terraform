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

resource "random_id" "suffix" {
  byte_length = 4
}

resource "google_storage_bucket" "bucket" {
  name     = "my-bucket-${random_id.suffix.hex}"
  location = "US"
  force_destroy = true
}

output "bucket_name" {
  value = google_storage_bucket.bucket.name
}