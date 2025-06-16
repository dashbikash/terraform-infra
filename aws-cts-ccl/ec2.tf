# If you want Terraform to generate the key pair instead of using an existing public key:
# resource "tls_private_key" "ec2-key-pair" {
#   algorithm = "RSA"
#   rsa_bits  = 4096
# }

# resource "local_file" "ec2-key-pair-private-key" {
#   content         = tls_private_key.ec2-key-pair.private_key_pem
#   filename        = "${path.module}/ec2-key-pair.pem"
#   file_permission = "0600"
# }

# resource "aws_key_pair" "ec2-key-pair" {
#   key_name   = "ec2-key-pair"
#   public_key = tls_private_key.ec2-key-pair.public_key_openssh
# }

# resource "aws_instance" "ec2-instance-free-1" {
#   ami               = "ami-0ae9f87d24d606be4" # Replace with your desired AMI ID
#   instance_type     = "t2.micro"              # Free tier eligible instance type
#   key_name          = aws_key_pair.ec2-key-pair.key_name
#   security_groups   = [aws_security_group.sg-ssh-and-80.name]
#   availability_zone = "us-east-2a" # Change to your preferred AZ
#   user_data         = <<-EOF
#           #!/bin/bash
#           sudo yum update -y
#           sudo amazon-linux-extras install epel -y
#           sudo yum install -y httpd
#           sudo systemctl enable httpd
#           sudo systemctl start httpd
#           echo "<h1>Hello from $(hostname -f)</h1>" | sudo tee /var/www/html/index.html
#         EOF

#   tags = {
#     Name = "FreeEC2Instance"
#   }
# }

# resource "aws_instance" "ec2-instance-free-2" {
#   ami               = "ami-0ae9f87d24d606be4" # Replace with your desired AMI ID
#   instance_type     = "t2.micro"              # Free tier eligible instance type
#   key_name          = aws_key_pair.ec2-key-pair.key_name
#   security_groups   = [aws_security_group.sg-ssh-and-80.name]
#   availability_zone = "us-east-2a" # Change to your preferred AZ
#   user_data         = <<-EOF
#           #!/bin/bash
#           sudo yum update -y
#           sudo amazon-linux-extras install epel -y
#           sudo yum install -y httpd
#           sudo systemctl enable httpd
#           sudo systemctl start httpd
#           echo "<h1>Hello from $(hostname -f)</h1>" | sudo tee /var/www/html/index.html
#         EOF

#   tags = {
#     Name = "FreeEC2Instance"
#   }
# }


# resource "aws_launch_template" "ec2_launch_template" {
#   name_prefix   = "ec2-launch-template-"
#   image_id      = "ami-0ae9f87d24d606be4"
#   instance_type = "t2.micro"
#   key_name      = aws_key_pair.ec2-key-pair.key_name

#   network_interfaces {
#     associate_public_ip_address = true
#     security_groups             = [aws_security_group.sg-ssh-and-80.id]
#   }
#   block_device_mappings {
#     device_name = "/dev/xvda"
#     ebs {
#       volume_size           = 8
#       volume_type           = "gp2"
#       delete_on_termination = true
#     }
#   }


#   user_data = base64encode(<<-EOF
#     #!/bin/bash
#     sudo yum update -y
#     sudo amazon-linux-extras install epel -y
#     sudo yum install -y httpd
#     sudo systemctl enable httpd
#     sudo systemctl start httpd
#     echo "<h1>Hello from $(hostname -f)</h1>" | sudo tee /var/www/html/index.html
#   EOF
#   )

#   tag_specifications {
#     resource_type = "instance"
#     tags = {
#       Name = "FreeEC2Instance"
#     }
#   }
# }

# resource "aws_autoscaling_group" "ec2_autoscaling_group" {
#   launch_template {
#     id      = aws_launch_template.ec2_launch_template.id
#     version = "$Latest"
#   }
#   min_size            = 1
#   max_size            = 2
#   desired_capacity    = 2
#   vpc_zone_identifier = local.subnets
#   target_group_arns   = [aws_lb_target_group.ec2_tg_alb.arn] # <-- Attach existing ALB target group
#   tag {
#     key                 = "Name"
#     value               = "FreeEC2Instance"
#     propagate_at_launch = true
#   }
# }

