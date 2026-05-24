resource "aws_rekognition_collection" "asistencia" {
  collection_id = var.rekognition_collection_id
  tags = {
    Name = "AsistenciaBiometrica"
  }
}
