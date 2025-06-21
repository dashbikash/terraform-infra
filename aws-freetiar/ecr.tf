resource "aws_ecr_repository" "ecr_demo_repo" {
  name                 = "grpcgo"
  image_tag_mutability = "MUTABLE" # or "IMMUTABLE"
  encryption_configuration {
    encryption_type = "AES256"
  }

  tags = {
    Environment = "Dev"
    Project     = "MyProject"
  }
}