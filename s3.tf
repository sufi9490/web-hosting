resource "aws_s3_bucket" "lonlywolf" {
    bucket = "lonlywolf22"
    acl = "private"
    
    tags = {
    	Name = "demo_s3"
        Purpose = "Demo_Project"
    }
}
