resource "aws_dynamodb_table" "dynamo_bikash_tbl" {
    name           = "dynamo_bikash_tbl"
    billing_mode   = "PAY_PER_REQUEST"

    hash_key       = "id"

    attribute {
        name = "id"
        type = "S"
        
    }

    tags = {
        Environment = "dev"
        Name        = "dynamo_bikash_tbl"
        Author      = "Bikash"
    }
}