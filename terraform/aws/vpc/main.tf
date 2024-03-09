module "vpc-systems" {
  source           = "../../../modules//vpc"
  env              = "systems"
  cidr_prefix      = data.terraform_remote_state.global.outputs.systems_cidr_prefix
  aws_access_key   = var.aws_access_key
  aws_secret_key   = var.aws_secret_key
  s3_bucket_prefix = data.terraform_remote_state.global.outputs.vpc_s3_bucket_prefix
  aws_region       = var.aws_region
}

module "vpc-dev" {
  source           = "../../../modules//vpc"
  env              = "dev"
  cidr_prefix      = data.terraform_remote_state.global.outputs.uat_cidr_prefix
  aws_access_key   = var.aws_access_key
  aws_secret_key   = var.aws_secret_key
  s3_bucket_prefix = data.terraform_remote_state.global.outputs.vpc_s3_bucket_prefix
  aws_region       = var.aws_region
}

module "vpc-uat" {
  source           = "../../../modules//vpc"
  env              = "uat"
  cidr_prefix      = data.terraform_remote_state.global.outputs.uat_cidr_prefix
  aws_access_key   = var.aws_access_key
  aws_secret_key   = var.aws_secret_key
  s3_bucket_prefix = data.terraform_remote_state.global.outputs.vpc_s3_bucket_prefix
  aws_region       = var.aws_region
}


output "subnet_protected_systems" {
  value = tomap({
    "a" = tomap({
      "id"   = modules.vpc-systems.subnet_protected_1a_id,
      "name" = modules.vpc-systems.subnet_protected_1a_name,
      "zone" = modules.vpc-systems.availability_zone
    }),
    "b" = tomap({
      "id"   = modules.vpc-systems.subnet_protected_1b_id,
      "name" = modules.vpc-systems.subnet_protected_1b_name,
      "zone" = modules.vpc-systems.availability_zone
    }),
    "c" = tomap({
      "id"   = modules.vpc-systems.subnet_protected_1c_id,
      "name" = modules.vpc-systems.subnet_protected_1c_name,
      "zone" = modules.vpc-systems.availability_zone
    }),
  })
}

output "subnet_private_systems" {
  value = tomap({
    "a" = tomap({
      "id"   = modules.vpc-systems.subnet_private_1a_id,
      "name" = modules.vpc-systems.subnet_private_1a_name,
      "zone" = modules.vpc-systems.availability_zone
    }),
    "b" = tomap({
      "id"   = modules.vpc-systems.subnet_private_1b_id,
      "name" = modules.vpc-systems.subnet_private_1b_name,
      "zone" = modules.vpc-systems.availability_zone
    }),
    "c" = tomap({
      "id"   = modules.vpc-systems.subnet_private_1c_id,
      "name" = modules.vpc-systems.subnet_private_1c_name,
      "zone" = modules.vpc-systems.availability_zone
    }),
  })

}

output "subnet_public_systems" {
  value = tomap({
    "a" = tomap({
      "id"   = modules.vpc-systems.subnet_public_1a_id,
      "name" = modules.vpc-systems.subnet_public_1a_name,
      "zone" = modules.vpc-systems.availability_zone
    }),
    "b" = tomap({
      "id"   = modules.vpc-systems.subnet_public_1b_id,
      "name" = modules.vpc-systems.subnet_public_1b_name,
      "zone" = modules.vpc-systems.availability_zone
    }),
    "c" = tomap({
      "id"   = modules.vpc-systems.subnet_public_1c_id,
      "name" = modules.vpc-systems.subnet_public_1c_name,
      "zone" = modules.vpc-systems.availability_zone
    }),
  })

}

output "subnet_vpn_systems" {
  value = tomap({
    "a" = tomap({
      "id"   = modules.vpc-systems.subnet_vpn_1a_id,
      "name" = modules.vpc-systems.subnet_vpn_1a_name,
      "zone" = modules.vpc-systems.availability_zone
    }),
    "b" = tomap({
      "id"   = modules.vpc-systems.subnet_vpn_1b_id,
      "name" = modules.vpc-systems.subnet_vpn_1b_name,
      "zone" = modules.vpc-systems.availability_zone
    }),
    "c" = tomap({
      "id"   = modules.vpc-systems.subnet_vpn_1c_id,
      "name" = modules.vpc-systems.subnet_vpn_1c_name,
      "zone" = modules.vpc-systems.availability_zone
    }),
  })
}




output "subnet_protected_dev" {
  value = tomap({
    "a" = tomap({
      "id"   = modules.vpc-dev.subnet_protected_1a_id,
      "name" = modules.vpc-dev.subnet_protected_1a_name,
      "zone" = modules.vpc-dev.availability_zone
    }),
    "b" = tomap({
      "id"   = modules.vpc-dev.subnet_protected_1b_id,
      "name" = modules.vpc-dev.subnet_protected_1b_name,
      "zone" = modules.vpc-dev.availability_zone
    }),
    "c" = tomap({
      "id"   = modules.vpc-dev.subnet_protected_1c_id,
      "name" = modules.vpc-dev.subnet_protected_1c_name,
      "zone" = modules.vpc-dev.availability_zone
    }),
  })
}

output "subnet_private_dev" {
  value = tomap({
    "a" = tomap({
      "id"   = modules.vpc-dev.subnet_private_1a_id,
      "name" = modules.vpc-dev.subnet_private_1a_name,
      "zone" = modules.vpc-dev.availability_zone
    }),
    "b" = tomap({
      "id"   = modules.vpc-dev.subnet_private_1b_id,
      "name" = modules.vpc-dev.subnet_private_1b_name,
      "zone" = modules.vpc-dev.availability_zone
    }),
    "c" = tomap({
      "id"   = modules.vpc-dev.subnet_private_1c_id,
      "name" = modules.vpc-dev.subnet_private_1c_name,
      "zone" = modules.vpc-dev.availability_zone
    }),
  })

}

output "subnet_public_dev" {
  value = tomap({
    "a" = tomap({
      "id"   = modules.vpc-dev.subnet_public_1a_id,
      "name" = modules.vpc-dev.subnet_public_1a_name,
      "zone" = modules.vpc-systems.availability_zone
    }),
    "b" = tomap({
      "id"   = modules.vpc-dev.subnet_public_1b_id,
      "name" = modules.vpc-dev.subnet_public_1b_name,
      "zone" = modules.vpc-dev.availability_zone
    }),
    "c" = tomap({
      "id"   = modules.vpc-dev.subnet_public_1c_id,
      "name" = modules.vpc-dev.subnet_public_1c_name,
      "zone" = modules.vpc-dev.availability_zone
    }),
  })

}

output "subnet_vpn_dev" {
  value = tomap({
    "a" = tomap({
      "id"   = modules.vpc-dev.subnet_vpn_1a_id,
      "name" = modules.vpc-dev.subnet_vpn_1a_name,
      "zone" = modules.vpc-dev.availability_zone
    }),
    "b" = tomap({
      "id"   = modules.vpc-dev.subnet_vpn_1b_id,
      "name" = modules.vpc-dev.subnet_vpn_1b_name,
      "zone" = modules.vpc-dev.availability_zone
    }),
    "c" = tomap({
      "id"   = modules.vpc-dev.subnet_vpn_1c_id,
      "name" = modules.vpc-dev.subnet_vpn_1c_name,
      "zone" = modules.vpc-dev.availability_zone
    }),
  })
}







output "subnet_protected_uat" {
  value = tomap({
    "a" = tomap({
      "id"   = modules.vpc-uat.subnet_protected_1a_id,
      "name" = modules.vpc-uat.subnet_protected_1a_name,
      "zone" = modules.vpc-uat.availability_zone
    }),
    "b" = tomap({
      "id"   = modules.vpc-uat.subnet_protected_1b_id,
      "name" = modules.vpc-uat.subnet_protected_1b_name,
      "zone" = modules.vpc-uat.availability_zone
    }),
    "c" = tomap({
      "id"   = modules.vpc-uat.subnet_protected_1c_id,
      "name" = modules.vpc-uat.subnet_protected_1c_name,
      "zone" = modules.vpc-uat.availability_zone
    }),
  })
}

output "subnet_private_uat" {
  value = tomap({
    "a" = tomap({
      "id"   = modules.vpc-uat.subnet_private_1a_id,
      "name" = modules.vpc-uat.subnet_private_1a_name,
      "zone" = modules.vpc-uat.availability_zone
    }),
    "b" = tomap({
      "id"   = modules.vpc-uat.subnet_private_1b_id,
      "name" = modules.vpc-uat.subnet_private_1b_name,
      "zone" = modules.vpc-uat.availability_zone
    }),
    "c" = tomap({
      "id"   = modules.vpc-uat.subnet_private_1c_id,
      "name" = modules.vpc-uat.subnet_private_1c_name,
      "zone" = modules.vpc-uat.availability_zone
    }),
  })

}

output "subnet_public_uat" {
  value = tomap({
    "a" = tomap({
      "id"   = modules.vpc-uat.subnet_public_1a_id,
      "name" = modules.vpc-uat.subnet_public_1a_name,
      "zone" = modules.vpc-uat.availability_zone
    }),
    "b" = tomap({
      "id"   = modules.vpc-uat.subnet_public_1b_id,
      "name" = modules.vpc-uat.subnet_public_1b_name,
      "zone" = modules.vpc-uat.availability_zone
    }),
    "c" = tomap({
      "id"   = modules.vpc-uat.subnet_public_1c_id,
      "name" = modules.vpc-uat.subnet_public_1c_name,
      "zone" = modules.vpc-uat.availability_zone
    }),
  })

}

output "subnet_vpn_uat" {
  value = tomap({
    "a" = tomap({
      "id"   = modules.vpc-uat.subnet_vpn_1a_id,
      "name" = modules.vpc-uat.subnet_vpn_1a_name,
      "zone" = modules.vpc-uat.availability_zone
    }),
    "b" = tomap({
      "id"   = modules.vpc-uat.subnet_vpn_1b_id,
      "name" = modules.vpc-dev.subnet_vpn_1b_name,
      "zone" = modules.vpc-uat.availability_zone
    }),
    "c" = tomap({
      "id"   = modules.vpc-uat.subnet_vpn_1c_id,
      "name" = modules.vpc-uat.subnet_vpn_1c_name,
      "zone" = modules.vpc-uat.availability_zone
    }),
  })
}

output "vpc_systems" {
  value = tomap({
    "cidr" = "${data.terraform_remote_state.global.outputs.systems_cidr_prefix}.0.0/16",
    "id"   = modules.vpc-systems.vpc_id,
    "nat"  = modules.vpc-systems.vpc_nat,
    "igw"  = modules.vpc-systems.vpc_igw
  })

}

output "vpc_dev" {
  value = tomap({
    "cidr" = "${data.terraform_remote_state.global.outputs.dev_cidr_prefix}.0.0/16",
    "id"   = modules.vpc-dev.vpc_id,
    "nat"  = modules.vpc-dev.vpc_nat,
    "igw"  = modules.vpc-dev.vpc_igw
  })

}

output "vpc_uat" {
  value = tomap({
    "cidr" = "${data.terraform_remote_state.global.outputs.uat_cidr_prefix}.0.0/16",
    "id"   = modules.vpc-uat.vpc_id,
    "nat"  = modules.vpc-uat.vpc_nat,
    "igw"  = modules.vpc-uat.vpc_igw
  })

}

output "vpc_prod" {
  value = tomap({
    "cidr" = "${data.terraform_remote_state.global.outputs.prod_cidr_prefix}.0.0/16",
    "id"   = modules.vpc-prod.vpc_id,
    "nat"  = modules.vpc-prod.vpc_nat,
    "igw"  = modules.vpc-prod.vpc_igw
  })

}