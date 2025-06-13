
resource "aws_security_group" "sg-ssh-and-80" {
  name        = "sg_ssh_and_80"
  description = "Allow inbound 8080 and outbound SSH"
  vpc_id      = local.vpc_id

  ingress {
    description = "Allow HTTP 80"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow inbound SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # For better security, restrict to your IP
  }

  egress {
    description = "Allow outbound SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Author = "bikash"
  }

}


resource "aws_security_group" "sg-http80-only" {
  name        = "sg_http80_only"
  description = "Allow inbound 80"
  vpc_id      = local.vpc_id

  ingress {
    description = "Allow HTTP 80"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Author = "bikash"
  }

}