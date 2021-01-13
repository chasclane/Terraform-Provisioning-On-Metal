variable "api_key" {}
variable "project_id" {}
variable "name" {}

provider "packet" {
  auth_token          =   var.api_key
}
#Create an SSH Key Pair to use to securely access the servers once provisioned:
resource "tls_private_key" "my_tf_ssh_key" {
  algorithm           =   "RSA"
  rsa_bits            =   4096
}

resource "local_file" "my_tf_priv_key" {
    content           =   chomp(tls_private_key.my_tf_ssh_key.private_key_pem)
    filename          =   "my_tf_ssh_key"
    file_permission   =   "0400"
}
#Upload the Public Key to Equinix Metal, Point to the locally saved Private Key for authorization.
resource "packet_ssh_key" "my_tf_ssh_key" {
  name                =   "my_tf_ssh_key"
  public_key          =   chomp(tls_private_key.my_tf_ssh_key.public_key_openssh)
}
#Provision one or more servers in the given datacenter (facility), with the given OS, to the provided project.
resource "packet_device" "my_tf_server" {
  depends_on          =   [packet_ssh_key.my_tf_ssh_key]
  count               =   2 
  hostname            =   format("%s-%02d", var.name, count.index + 1)
  plan                =   "c2.medium.x86"
  facilities          =   ["ewr1"]
  operating_system    =   "centos_7"
  billing_cycle       =   "hourly"
  project_id          =   var.project_id
}
#Outputting IP Address(es) for the created instance(s). To SSH into these, open a terminal (Linux/Mac), and type ssh root@(IP ADDRESS)
output "IP_Address" {
  value = packet_device.my_tf_server[*].access_public_ipv4
}

