resource "google_compute_network" "ovirt-network" {
  name = "${var.network}"
}

