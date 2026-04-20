terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  profile = var.aws_profile
  region  = var.aws_region
}

resource "aws_rekognition_collection" "asistencia" {
  collection_id = var.rekognition_collection_id
  tags = {
    Name = "AsistenciaBiometrica"
  }
}

resource "aws_iam_user" "n8n_rekognition_user" {
  name = "n8n-rekognition-service-user"
  path = "/service-accounts/"
}

resource "aws_iam_access_key" "n8n_rekognition_key" {
  user = aws_iam_user.n8n_rekognition_user.name
}

data "aws_iam_policy" "rekognition_full_access" {
  name = "AmazonRekognitionFullAccess"
}

resource "aws_iam_user_policy_attachment" "n8n_rekognition_attach" {
  user       = aws_iam_user.n8n_rekognition_user.name
  policy_arn = data.aws_iam_policy.rekognition_full_access.arn
}
