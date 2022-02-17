resource "openstack_compute_keypair_v2" "libvirtbuilder" {
  provider   = openstack # Provider name declared in provider.tf
  region     = "GRA9"
  name       = "libvirtbuilder" # Name of the SSH key to use for creation
  public_key = file("../../id_rsa.pub") # Path to your previously generated SSH key
}