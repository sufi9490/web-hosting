provider "aws" {
  region = "us-east-2"
}
resource "aws_s3_bucket" "b1" {

  bucket = "s3-terraform-bucket-lab-demo"

  acl    = "authenticated-read"

  policy = file("policy.json")

  website {

    index_document = "index.html"

    error_document = "error.html"
  }


  tags = {

    Name        = "My bucket"

    Environment = "Dev"

  }

}

resource "aws_s3_bucket_object" "object1" {

  bucket = aws_s3_bucket.b1.id

  key    = "index.html"

  acl    = "public-read-write"

  source = "index.html"


}

resource "aws_s3_bucket_object" "object2" {

  bucket = aws_s3_bucket.b1.id

  key    = "error.html"

  acl    = "public-read-write"

  source = "error.html"


}
