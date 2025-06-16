resource "aws_db_instance" "rds_mysql" {
  allocated_storage      = 5
  storage_type           = "gp2"
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = "db.t3.micro"
  db_name                = local.mysql_dbname
  username               = local.mysql_username
  password               = local.mysql_password
  publicly_accessible    = true
  skip_final_snapshot    = true
  vpc_security_group_ids = [aws_security_group.sg_rds_mysql.id]
  availability_zone = "us-east-2a" # Specify the availability zone if needed
  
  tags = {
    Name = "MySQL-RDS-Instance"
  }
}

resource "aws_security_group" "sg_rds_mysql" {
  name        = "rds-sg"
  description = "Allow MySQL inbound traffic"

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  lifecycle {
    ignore_changes = [tags]
  }
}