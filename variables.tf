variable "aws_profile" {
  description = "The AWS profile to use for authentication"
  type        = string
  default     = "default"
}

variable "aws_region" {
  description = "The AWS region to use"
  type        = string
  default     = "us-east-1"
}

variable "rekognition_collection_id" {
  description = "ID de la colección de Rekognition"
  type        = string
  default     = "colegio-narvaez-collection"
}
