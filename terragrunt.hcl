remote_state = {
    # DynamoDB backend for locking
    backend = "dynamodb"
    config = {
        state_file_id = "global/s3"
    }

    # S3 backend for storing tfstate files
    backend = "s3"
    config = {
        encrypt = true
        bucket = "tfstate-tar-testing"
        key = "global/s3/terraform.tfstate"
        region = "us-east-1"
    }
}



