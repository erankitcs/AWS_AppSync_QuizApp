output "dynamodb_datasource" {
  value = aws_appsync_datasource.dynamodb_tbl_datasource.name
}