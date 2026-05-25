output "environment" {
  value       = local.environment
  description = "Current workspace environment"
}

output "aws_access_key_id" {
  value       = aws_iam_access_key.rekognition_key.id
  description = "Access Key ID para configurar en n8n"
  sensitive   = false
}

output "aws_secret_access_key" {
  value       = aws_iam_access_key.rekognition_key.secret
  description = "Secret Access Key para configurar en n8n"
  sensitive   = true
}

output "rekognition_collection_arn" {
  value       = aws_rekognition_collection.asistencia.arn
  description = "ARN de la colección de Rekognition creada"
}

output "cognito_user_pool_id" {
  value       = aws_cognito_user_pool.pool.id
  description = "ID del User Pool de Cognito"
}

output "cognito_pool_client_id" {
  value       = aws_cognito_user_pool_client.frontend_client.id
  description = "ID del User Pool Client de Cognito"
}
