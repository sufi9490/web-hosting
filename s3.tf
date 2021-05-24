resource "aws_s3_bucket" "lonlywolf22" {
    bucket = "lonlywolf2256"
    acl = "private"
    
    tags = {
    	Name = "demo_s3"
        Purpose = "Demo_Project"
    }
}
