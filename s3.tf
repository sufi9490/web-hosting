resource "aws_s3_bucket" "lonlywolf22" {
    bucket = "lonlywolf226"
    acl = "public"
    
    tags = {
    	Name = "demo_s3"
        Purpose = "Demo_Project"
    }
}
