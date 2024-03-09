variable "aws_region" {
  default = "us-east-1"
}

variable "env" {
  default = "systems"
}

terraform {
  backend "s3" {
    bucket = "tyler-supercoolcompany-terraform-state"
    key    = "vpc/main.tfstate"
    region = "us-east-1"
  }
}

data "terraform_remote_state" "global" {
  backend = "s3"

  config = {
    bucket = "tradeblock-preprod-terraform-state"
    key    = "global/variables/main.tfstate"
  }
}
