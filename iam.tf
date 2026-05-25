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
