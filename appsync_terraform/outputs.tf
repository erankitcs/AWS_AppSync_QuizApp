output "api_uris" {
  value = module.quizapi.api_uris
}

output "dynamodb_name" {
  value = module.dynamodb.questions_tbl_name
}