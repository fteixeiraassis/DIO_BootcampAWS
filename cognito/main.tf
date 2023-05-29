provider "aws" {
  region = "us-east-1"  # substitua pela região desejada
}

resource "aws_lambda_function" "example_lambda" {
  function_name    = "example-lambda-function"
  role             = aws_iam_role.lambda_role.arn
  runtime          = "nodejs14.x"
  handler          = "index.handler"
  filename         = "example_lambda.zip"  # substitua pelo nome do arquivo ZIP que contém o código da função
  source_code_hash = filebase64sha256("example_lambda.zip")

  environment {
    variables = {
      AWS_ACCESS_KEY_ID     = var.aws_access_key_id
      AWS_SECRET_ACCESS_KEY = var.aws_secret_access_key
    }
  }
}

resource "aws_iam_role" "lambda_role" {
  name = "lambda-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_policy_attachment" "lambda_policy_attachment" {
  name       = "lambda-policy-attachment"
  roles      = [aws_iam_role.lambda_role.name]
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}
