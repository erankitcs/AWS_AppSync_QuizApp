module "quizapi" {
    source = "./graphql_api"
}

module "dynamodb" {
    source = "./dynamodb"
}

module "datasource" {
    source = "./datasource"
    dyanamodb_table_name = module.dynamodb.questions_tbl_name
    api_id               = module.quizapi.quizapi_id
}

module "resolver" {
    source = "./resolver"
    dynamodb_datasource = module.datasource.dynamodb_datasource
    api_id               = module.quizapi.quizapi_id
}