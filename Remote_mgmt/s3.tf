resource "aws_s3_bucket" "s3-backend" {
  bucket = "remote-s3-backend-tf"

  tags = {
    Name        = "remote-s3-backend-tf"
    Environment = "Dev"
  }
}