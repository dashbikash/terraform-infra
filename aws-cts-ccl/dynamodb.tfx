resource "aws_dynamodb_table" "dynamo_bikash_tbl" {
  name         = "dynamo_bikash_tbl"
  billing_mode = "PAY_PER_REQUEST"

  hash_key = "id"
  range_key = "dob"

  attribute {
    name = "id"
    type = "S"
  }
  attribute {
    name = "dob"
    type = "N"
  }
  ttl {
    attribute_name = "TimeToExist"
    enabled        = true
  }

  tags = {
    Environment = "dev"
    Name        = "dynamo_bikash_tbl"
    Author      = "Bikash"
  }
}