provider "aws" {
  region = "us-east-2"
}
resource "aws_s3_bucket" "b1" {

  bucket = "s3-terraform-bucket-lab-demo"

  acl    = "public-read"

  tags = {

    Name        = "My bucket"

    Environment = "Dev"

  }

}

resource "aws_s3_bucket_object" "object" {

  bucket = aws_s3_bucket.b1.id

  key    = "profile"

  acl    = "public-read"

  source = "html/index.html"

  etag = filemd5("html/index.html")

}
