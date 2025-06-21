data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "iam_for_lambda" {
  name               = "iam_for_lambda"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

data "archive_file" "lambda" {
  type        = "zip"
  source_file = "../modules/go-lambda/bootstrap"
  output_path = "../modules/go-lambda/golambda.zip"
}

resource "aws_lambda_function" "test_lambda" {
  # If the file is not in the current working directory you will need to include a
  # path.module in the filename.
  filename      = "../modules/go-lambda/golambda.zip"
  function_name = "lambda_function_name"
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "bootstrap"

  source_code_hash = data.archive_file.lambda.output_base64sha256

  runtime     = "provided.al2" # Use provided.al2 for Go Lambda functions
  timeout     = 30
  memory_size = 128
  architectures = ["arm64"]

  environment {
    variables = {
      foo = "bar"
    }
  }
}