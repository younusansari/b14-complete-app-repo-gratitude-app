module "website_bucket" {
  source = "./modules/s3_bucket"
  bucket_name = var.website_bucket_name

}