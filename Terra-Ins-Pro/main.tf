resource "google_compute_instance" "demo1-instance" {
  name = "demo1"

  ## for a setup having multiple instances of the same type, you can do
  ## the following, there would be 2 instances of the same configuration
  ## provisioned
  ## count        = 1
  ## name         = "${var.instance-name}-${count.index}"
  machine_type = "${var.vm_type["7point5gig"]}"

  zone = "${var.region}"

  tags = [
    "${var.network}-firewall-ssh",
    "${var.network}-firewall-http",
    "${var.network}-firewall-https"
    ]

 boot_disk {
   initialize_params {
    image = "${var.os["ubuntu-1604-lts"]}"
  }
}
// Local SSD disk
  scratch_disk {
  }

  metadata {
    hostname = "bar"
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }
}

resource "google_compute_instance" "demo2-instance" {
  name = "demo2"

  ## for a setup having multiple instances of the same type, you can do
  ## the following, there would be 2 instances of the same configuration
  ## provisioned
  ## count        = 1
  ## name         = "${var.instance-name}-${count.index}"
  machine_type = "${var.vm_type["7point5gig"]}"

  zone = "${var.region}"

  tags = [
    "${var.network}-firewall-ssh",
    "${var.network}-firewall-http",
    "${var.network}-firewall-https",
    ]

  boot_disk {
    initialize_params {
    image = "${var.os["ubuntu-1604-lts"]}"
    }
}
// Local SSD disk
  scratch_disk {
  }

  metadata {
    hostname = "demo"
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }
}
