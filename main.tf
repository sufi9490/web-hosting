provider "aws" {
  region = "us-east-2"
}

resource "aws_s3_bucket" "site" {

  bucket = "s3-terraform-bucket-lab-demo"

  acl    = "public-read"

  policy = aws_s3_bucket.site

  website {

    index_document = "index.html"

    error_document = "error.html"
  }

}

resource "aws_s3_bucket" "b1" {

  bucket = "$b1.{s3-terraform-bucket-lab-demo}"

  acl    = "public-read"

  policy = ""

   website {

    redirect_all_requests_to = "https://s3-terraform-bucket-lab-demo"

   }

}

resource "aws_s3_bucket_policy" "public_read" {
  bucket = aws_s3_bucket.site.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource = [
          aws_s3_bucket.site.arn,
          "${aws_s3_bucket.site.arn}/*",
        ]
      },
    ]
  })
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

