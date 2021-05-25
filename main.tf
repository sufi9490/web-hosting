provider "aws"{
  region = "us-east-2"
}

resource "aws_s3_bucket" "site" {

  bucket = "var.site_domain"

  acl    = "public-read"

  website {

    index_document = "index.html"

    error_document = "error.html"
  }

}

resource "aws_s3_bucket" "b1" {

  bucket = "$b1.{var.site_domain}"

  acl    = "public-read"


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

