provider "aws" {}

module "s3-website" {
  source = "../../modules/s3-website"

  bucket_name = "lonlywolf24"
}

output "website_endpoint" {
  value = module.s3-website.website_endpoint
}

