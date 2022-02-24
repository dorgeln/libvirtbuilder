resource "libvirt_domain" "debian11tf" {
    provisioner "file" {
    source      = "/var/lib/libvirt/images/templates/"
    destination = "/etc/myapp.conf"
  }
}