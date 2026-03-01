resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name

  # tags = {
  #   Name        = var.name_creator
  #   Environment = var.environment
  # }
}