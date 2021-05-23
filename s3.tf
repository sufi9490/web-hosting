resource "aws_s3_bucket_object" "folder1" {
    bucket = "aws_s3_bucket"
    acl    = "public-read"
    key    = "Folder1/"
    source = "/dev/null"
}
