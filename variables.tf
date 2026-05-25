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

variable "project_name" {
  description = "Base project name used in resource naming"
  type        = string
  default     = "school-narvaez"
}

locals {
  environment = terraform.workspace
  prefix      = "${var.project_name}-${local.environment}"
}
