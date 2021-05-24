resource "aws_s3_bucket_object" "object" {

  bucket = "lonlywolf226"

  key    = "profile"

  acl    = "public-read"

  source = "Users/PRDTHVIRAJ MR/Desktop/lonlywolf.txt"

  etag = filemd5("Users/PRDTHVIRAJ MR/Desktop/lonlywolf.txt")

}
