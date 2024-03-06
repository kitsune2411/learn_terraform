# Description: Create a key pair for EC2 instances
resource "aws_key_pair" "deployer" {
  key_name   = var.keypair_name
  public_key = tls_private_key.rsa-4096.public_key_openssh
}

# RSA key of size 4096 bits
resource "tls_private_key" "rsa-4096" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Save the private key to a file
resource "local_file" "tf_private_key" {
  filename = "${path.module}/${var.keypair_name}.pem"
  content  = tls_private_key.rsa-4096.private_key_pem

}
