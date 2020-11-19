resource "aws_appsync_resolver" "createQuestion_resolver" {
  api_id      = var.api_id
  field       = "createQuestion"
  type        = "Mutation"
  data_source = var.dynamodb_datasource

  request_template = <<EOF
{
    "version" : "2017-02-28",
    "operation" : "PutItem",
    "key" : {
        ## If object "id" should come from GraphQL arguments, change to $util.dynamodb.toDynamoDBJson($ctx.args.id)
        "id": $util.dynamodb.toDynamoDBJson($util.autoId()),
    },
    "attributeValues" : $util.dynamodb.toMapValuesJson($ctx.args.input)
}
EOF

  response_template = <<EOF
$util.toJson($ctx.result)
EOF

}

resource "aws_appsync_resolver" "listQuestions_resolver" {
  api_id      = var.api_id
  field       = "listQuestions"
  type        = "Query"
  data_source = var.dynamodb_datasource

  request_template = <<EOF
{
    "version" : "2017-02-28",
    "operation" : "Scan",
    "limit": $util.defaultIfNull($ctx.args.limit, 20),
    "nextToken": $util.toJson($util.defaultIfNullOrBlank($ctx.args.nextToken, null))
}
EOF

  response_template = <<EOF
$util.toJson($ctx.result)
EOF

}

resource "aws_appsync_resolver" "getQuestion_resolver" {
  api_id      = var.api_id
  field       = "getQuestion"
  type        = "Query"
  data_source = var.dynamodb_datasource

  request_template = <<EOF
{
    "version": "2017-02-28",
    "operation": "GetItem",
    "key": {
        "id": $util.dynamodb.toDynamoDBJson($ctx.args.id),
    }
}
EOF

  response_template = <<EOF
$util.toJson($ctx.result)
EOF

}