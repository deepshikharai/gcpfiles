provider "google" {
  credentials = "${file("account.json")}"
  project     = "${var.project-name}"
  region      = "${var.region}"
}
