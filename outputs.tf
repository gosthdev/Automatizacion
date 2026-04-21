
output "n8n_aws_access_key_id" {
  value       = aws_iam_access_key.n8n_rekognition_key.id
  description = "Access Key ID para configurar en n8n"
  sensitive   = false
}

output "n8n_aws_secret_access_key" {
  value       = aws_iam_access_key.n8n_rekognition_key.secret
  description = "Secret Access Key para configurar en n8n"
  sensitive   = true
}

output "rekognition_collection_arn" {
  value       = aws_rekognition_collection.asistencia.arn
  description = "ARN de la colección de Rekognition creada"
}
