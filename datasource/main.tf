resource "aws_iam_role" "dynamodb_access_role" {
  name = "quizapp_dynamodb_access_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "appsync.amazonaws.com"
      },
      "Effect": "Allow"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "dynamodb_access_policy" {
  name = "quizapp_dynamodb_access_policy"
  role = aws_iam_role.dynamodb_access_role.id

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "${var.dyanamodb_table_name}Table",
            "Effect": "Allow",
            "Action": [
                "dynamodb:BatchGetItem",
                "dynamodb:BatchWriteItem",
                "dynamodb:PutItem",
                "dynamodb:DeleteItem",
                "dynamodb:GetItem",
                "dynamodb:Scan",
                "dynamodb:Query",
                "dynamodb:UpdateItem"
            ],
            "Resource": [
                "arn:aws:dynamodb:*:*:table/${var.dyanamodb_table_name}",
                "arn:aws:dynamodb:*:*:table/${var.dyanamodb_table_name}/*"
            ]
        }
    ]
}
EOF
}

resource "aws_appsync_datasource" "dynamodb_tbl_datasource" {
  api_id           = var.api_id
  name             = "quizapp_dynamodb_tbl_datasource"
  service_role_arn = aws_iam_role.dynamodb_access_role.arn
  type             = "AMAZON_DYNAMODB"

  dynamodb_config {
    table_name = var.dyanamodb_table_name
  }
}