resource "aws_cognito_user_group" "parent" {
  user_pool_id = aws_cognito_user_pool.pool.id
  name         = "parent"
  description  = "Group for parent users"
}

resource "aws_cognito_user_group" "teacher" {
  user_pool_id = aws_cognito_user_pool.pool.id
  name         = "teacher"
  description  = "Group for teacher users"
}

resource "aws_cognito_user_group" "admin" {
  user_pool_id = aws_cognito_user_pool.pool.id
  name         = "admin"
  description  = "Group for admin users"
}
