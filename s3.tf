resource "aws_s3_bucket" "lonlywolf22" {
    bucket = "lonlywolfks"
    acl = "public-read-write"
    
    tags = {
    	Name = "demo_s3"
        Purpose = "Demo_Project_Presentation"
    }
}
