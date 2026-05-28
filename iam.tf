resource "aws_iam_user" "rekognition_user" {
  name = "${local.prefix}-rekognition-user"
  path = "/service-accounts/"
}

resource "aws_iam_access_key" "rekognition_key" {
  user = aws_iam_user.rekognition_user.name
}

data "aws_iam_policy" "rekognition_full_access" {
  name = "AmazonRekognitionFullAccess"
}

resource "aws_iam_user_policy_attachment" "n8n_rekognition_attach" {
  user       = aws_iam_user.rekognition_user.name
  policy_arn = data.aws_iam_policy.rekognition_full_access.arn
}

resource "aws_iam_user" "cognito_user" {
  name = "${local.prefix}-cognito-user"
  path = "/service-accounts/"
}

resource "aws_iam_access_key" "cognito_key" {
  user = aws_iam_user.cognito_user.name
}

data "aws_iam_policy_document" "cognito_admin" {
  statement {
    sid       = "CognitoAdminAccess"
    effect    = "Allow"
    actions   = ["cognito-idp:*"]
    resources = ["*"]
  }
}

resource "aws_iam_policy" "cognito_admin_policy" {
  name        = "${local.prefix}-cognito-admin-policy"
  description = "Policy for Cognito admin commands"
  policy      = data.aws_iam_policy_document.cognito_admin.json
}

resource "aws_iam_user_policy_attachment" "n8n_cognito_attach" {
  user       = aws_iam_user.cognito_user.name
  policy_arn = aws_iam_policy.cognito_admin_policy.arn
}
