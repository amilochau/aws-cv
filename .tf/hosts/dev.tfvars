conventions = {
  application_name = "cv"
  host_name        = "dev"
}

client_settings = {
  package_source_file   = "../src/cv-client/dist"
  s3_bucket_name_suffix = "milochau"
  domains = {
    zone_name   = "milochau.com"
    domain_name = "dev.cv.milochau.com"
  }
}
