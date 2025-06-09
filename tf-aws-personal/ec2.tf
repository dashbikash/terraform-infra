# If you want Terraform to generate the key pair instead of using an existing public key:
resource "tls_private_key" "ec2-key-pair" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "ec2-key-pair-private-key" {
  content         = tls_private_key.ec2-key-pair.private_key_pem
  filename        = "${path.module}/ec2-key-pair.pem"
  file_permission = "0600"
}

resource "aws_key_pair" "ec2-key-pair" {
  key_name   = "ec2-key-pair"
  public_key = tls_private_key.ec2-key-pair.public_key_openssh
}

resource "aws_instance" "ec2-instance-free-1" {
  ami               = "ami-0ae9f87d24d606be4" # Replace with your desired AMI ID
  instance_type     = "t2.micro"              # Free tier eligible instance type
  key_name          = aws_key_pair.ec2-key-pair.key_name
  security_groups   = [aws_security_group.sg-ssh-and-80.name]
  availability_zone = "us-east-2a" # Change to your preferred AZ
  user_data         = <<-EOF
          #!/bin/bash
          sudo yum update -y
          sudo amazon-linux-extras install epel -y
          sudo yum install -y nginx
          sudo systemctl enable nginx
          sudo systemctl start nginx
        EOF

  tags = {
    Name = "FreeEC2Instance"
  }
}

resource "aws_instance" "ec2-instance-free-2" {
  ami               = "ami-0ae9f87d24d606be4" # Replace with your desired AMI ID
  instance_type     = "t2.micro"              # Free tier eligible instance type
  key_name          = aws_key_pair.ec2-key-pair.key_name
  security_groups   = [aws_security_group.sg-ssh-and-80.name]
  availability_zone = "us-east-2a" # Change to your preferred AZ
  user_data         = <<-EOF
          #!/bin/bash
          sudo yum update -y
          sudo amazon-linux-extras install epel -y
          sudo yum install -y nginx
          sudo systemctl enable nginx
          sudo systemctl start nginx
        EOF

  tags = {
    Name = "FreeEC2Instance"
  }
}
