resource "aws_rekognition_collection" "asistencia" {
  collection_id = "${local.prefix}-collection"
  tags = {
    Name        = "AsistenciaBiometrica"
    Environment = local.environment
  }
}
