resource "aws_s3_bucket" "b1" {

  bucket = "s3-terraform-bucket-lab-demo"

  acl    = "public-read"

  tags = {

    Name        = "My bucket"

    Environment = "Dev"

  }

}
