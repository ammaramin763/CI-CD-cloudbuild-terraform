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

resource "google_storage_bucket" "my_app_bucket" {
  name                        = "my-app-bucket-${random_id.bucket_suffix.hex}"
  location                    = "US"
  storage_class               = "STANDARD"
  force_destroy               = true
  uniform_bucket_level_access = true

 
  # Block public access
  public_access_prevention = "enforced"


# Random suffix for unique global bucket name
resource "random_id" "bucket_suffix" {
  byte_length = 4
}

}