resource "aws_s3_bucket" "lonlywolf" {
    bucket = "lonlywolf22"
    acl = "private"
    
    tags = {
    	Name = "mobilelabs static"
        Environment = "Development"
    }
}
