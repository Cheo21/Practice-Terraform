
terraform {
  backend "s3" {
    bucket         = "tfstate-tar-testing"
    key            = "environments/testing/aws-s3-bucket.tfstate"
    region         = "us-east-1"
  }
}