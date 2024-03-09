terraform {
  backend "s3" {
    bucket = ""
    key    = "prod/ecs/main.tfstate"
    region = "us-west-2"
  }
}

data "terraform_remote_state" "global" {
  backend = "s3"

  config = {
    bucket = ""
    key    = "global/variables/main.tfstate"
  }
}

variable "ecs_cluster_name" {
  type = string
  default = "my-ecs-cluster-01"
}