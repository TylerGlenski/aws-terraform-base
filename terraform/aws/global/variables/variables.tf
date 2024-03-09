terraform {
  backend "s3" {
    bucket = ""
    key    = "global/variables/main.tfstate"
  }
}