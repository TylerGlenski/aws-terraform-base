module "cicd-runner-01" {
  source                        = "../../../modules//ec2/singleton"
  env                           = "${data.terraform_remote_state.vpc.outputs.vpc_systems.name}"
  iam_profile                   = "${data.terraform_remote_state.global.outputs.iam_profile_builder}"
  aws_region                    = "${data.terraform_remote_state.global.outputs.aws_region}"
  aws_ami                       = "${data.terraform_remote_state.global.outputs.ubuntu20_ami}"
  aws_keypair_name              = "${data.terraform_remote_state.global.outputs.aws_keypair_name}"
  subnet_availability_zone      = "${data.terraform_remote_state.vpc.outputs.subnet_private_systems.b.zone}"
  subnet_id                     = "${data.terraform_remote_state.vpc.outputs.subnet_private_systems.b.id}"
  subnet_name                   = "${data.terraform_remote_state.vpc.outputs.subnet_private_systems.b.name}"
  vpc_id                        = "${data.terraform_remote_state.vpc.outputs.vpc_systems.id}"
  disable_api_termination       = true
  monitoring                    = false
  associate_public_ip_address   = false
  ebs_optimized                 = true
  app_class                     = "cicd"
  app_role                      = "runner"
  instance_type                 = "t3.small"
  instance_name_tag_prefix      = "cicd-runner"
  root_block_device_volume_type = "gp2"
  security_group_description    = "cicd-runner-${data.terraform_remote_state.vpc.outputs.subnet_private_systems.b.name}-${data.terraform_remote_state.vpc.outputs.subnet_private_systems.b.zone}"
  source_dest_check             = true
  root_block_device_volume_size = 60
  server_number                 = 01
  ## Ingress ssh default access should only be from systems where you vpn lives. can further lock this down by using vpn subnet ##
  # if you did not yet launch a vpn feel free to change this in console to your ip address, jsut note it will overwrite when you tf apply #
  internal_cidr_blocks          = "${data.terraform_remote_state.global.outputs.systems_cidr_prefix}.0.0/16"
}

module "cicd-runner-02" {
  source                        = "../../../modules//ec2/singleton"
  env                           = "${data.terraform_remote_state.vpc.outputs.vpc_systems.name}"
  iam_profile                   = "${data.terraform_remote_state.global.outputs.iam_profile_builder}"
  aws_region                    = "${data.terraform_remote_state.global.outputs.aws_region}"
  aws_ami                       = "${data.terraform_remote_state.global.outputs.ubuntu20_ami}"
  aws_keypair_name              = "${data.terraform_remote_state.global.outputs.aws_keypair_name}"
  subnet_availability_zone      = "${data.terraform_remote_state.vpc.outputs.subnet_private_systems.a.zone}"
  subnet_id                     = "${data.terraform_remote_state.vpc.outputs.subnet_private_systems.a.id}"
  subnet_name                   = "${data.terraform_remote_state.vpc.outputs.subnet_private_systems.a.name}"
  vpc_id                        = "${data.terraform_remote_state.vpc.outputs.vpc_systems.id}"
  disable_api_termination       = true
  monitoring                    = false
  associate_public_ip_address   = false
  ebs_optimized                 = true
  app_class                     = "cicd"
  app_role                      = "runner"
  instance_type                 = "t3.small"
  instance_name_tag_prefix      = "cicd-runner"
  root_block_device_volume_type = "gp2"
  security_group_description    = "cicd-runner-${data.terraform_remote_state.vpc.outputs.subnet_private_systems.a.name}-${data.terraform_remote_state.vpc.outputs.subnet_private_systems.a.zone}"
  source_dest_check             = true
  root_block_device_volume_size = 60
  server_number                 = 02
  ## Ingress ssh default access should only be from systems where you vpn lives. can further lock this down by using vpn subnet ##
  # if you did not yet launch a vpn feel free to change this in console to your ip address, jsut note it will overwrite when you tf apply #
  internal_cidr_blocks          = "${data.terraform_remote_state.global.outputs.systems_cidr_prefix}.0.0/16"
}

## add ingress here ##