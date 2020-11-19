resource "aws_dynamodb_table" "quizapp-tbl" {
  name           = "QuizQuestions"
  billing_mode   = "PROVISIONED"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "id"
  
  attribute {
    name = "id"
    type = "S"
  }
  tags = {
    Name        = "quizapp-questions-table"
    Environment = "dev"
  }
}