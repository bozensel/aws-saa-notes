############################################
# ZIP Lambda Function
############################################

data "archive_file" "lambda_zip" {
  type        = "zip"
  source_file = "${path.module}/lambda.py"
  output_path = "${path.module}/lambda.zip"
}

############################################
# IAM Role for Lambda
############################################

resource "aws_iam_role" "lambda_role" {
  name = "${var.project_name}-lambda-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Principal = {
          Service = "lambda.amazonaws.com"
        }

        Action = "sts:AssumeRole"
      }
    ]
  })
}

############################################
# Attach Basic Lambda Permissions
############################################

resource "aws_iam_role_policy_attachment" "lambda_basic" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

############################################
# Lambda Function
############################################

resource "aws_lambda_function" "hello_lambda" {
  function_name = "hello-from-lambda"

  filename         = data.archive_file.lambda_zip.output_path
  source_code_hash = data.archive_file.lambda_zip.output_base64sha256

  role    = aws_iam_role.lambda_role.arn
  handler = "lambda.lambda_handler"
  runtime = "python3.12"

  timeout = 10
}

############################################
# API Gateway HTTP API
############################################

resource "aws_apigatewayv2_api" "http_api" {
  name          = "${var.project_name}-api"
  protocol_type = "HTTP"
}

############################################
# Lambda Integration
############################################

resource "aws_apigatewayv2_integration" "lambda_integration" {
  api_id = aws_apigatewayv2_api.http_api.id

  integration_type       = "AWS_PROXY"
  integration_uri        = aws_lambda_function.hello_lambda.invoke_arn
  integration_method     = "POST"
  payload_format_version = "2.0"
}

############################################
# Route
############################################

resource "aws_apigatewayv2_route" "hello_route" {
  api_id = aws_apigatewayv2_api.http_api.id

  route_key = "GET /hello"

  target = "integrations/${aws_apigatewayv2_integration.lambda_integration.id}"
}

############################################
# Stage
############################################

resource "aws_apigatewayv2_stage" "default" {
  api_id = aws_apigatewayv2_api.http_api.id

  name        = "$default"
  auto_deploy = true
}

############################################
# Allow API Gateway to Invoke Lambda
############################################

resource "aws_lambda_permission" "api_gw_permission" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.hello_lambda.function_name
  principal     = "apigateway.amazonaws.com"

  source_arn = "${aws_apigatewayv2_api.http_api.execution_arn}/*/*"
}
