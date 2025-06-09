# If you want Terraform to generate the key pair instead of using an existing public key:
resource "tls_private_key" "ec2-key-pair" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "ec2_private_key" {
  content         = tls_private_key.ec2-key-pair.private_key_pem
  filename        = "${pathexpand("~")}/ec2-key.pem"
  file_permission = "0600"
}

resource "aws_key_pair" "ec2_public_key" {
  key_name   = "ec2-key-pair"
  public_key = tls_private_key.ec2-key-pair.public_key_openssh
}

output "ec2_private_key_path" {
  value = local_file.ec2_private_key.filename
}

output "ec2_public_key" {
  value = tls_private_key.ec2-key-pair.public_key_openssh
}