provider "aws" {
region = "us-east-1"
}

resource "aws_s3_bucket" "example" {
  bucket = "tfstate-tar-testing"
}


resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.example.id
  versioning_configuration {
    status = "Enabled"
  }
}