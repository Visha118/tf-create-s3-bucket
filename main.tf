resource "aws_s3_bucket" "this" {
  bucket        = "tf-s3-state-bucket-1"
  force_destroy = true
}

#dynamo db table for state locking
resource "aws_dynamodb_table" "tf_state_lock_table" {
  name         = "terraform-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}

#add tags to both above resources
# app - tf-create-s3-bucket
# so that in future, we can track, which app is incurring how much cost