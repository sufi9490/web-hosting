provider "aws" {
  region = "us-east-2"
}
resource "aws_s3_bucket" "b1" {

  bucket = "s3-terraform-bucket-lab-demo"

  acl    = "public-read"

  policy = file("policy.json")

  tags = {

    Name        = "My bucket"

    Environment = "Dev"

  }

}

resource "aws_s3_bucket_object" "object1" {

  bucket = aws_s3_bucket.b1.id

  key    = "profile"

  acl    = "public-read"

  source = "html/index.html"

  etag = filemd5("html/index.html")

}

resource "aws_s3_bucket_object" "object2" {

  bucket = aws_s3_bucket.b1.id

  key    = "profile"

  acl    = "public-read"

  source = "html/error.html"

  etag = filemd5("html/error.html")

}

resource "aws_s3_bucket" "website" {

  bucket = "s3-terraform-bucket-lab-demo"

  acl    = "public-read"

  policy = file("policy.json")

  website {

    index_document = "index.html"

    error_document = "error.html"
  }

