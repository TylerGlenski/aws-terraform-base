# module "unique-job-name-01" {
#   source                         = "../../../modules//ecs_scheduled_task"
#   name_prefix                    = "unique-job-name-01"
#   event_rule_name                = "unique-job-name-01-fargate"
#   event_rule_schedule_expression = "cron(0 0 * * ? *)"
#   ecs_cluster_arn                = "arn:aws:ecs:${data.terraform_remote_state.global.outputs.aws_region}:${data.terraform_remote_state.global.outputs.aws_account_number}:cluster/ECS-prd-001"
#   ecs_launch_type                = "FARGATE"
#   event_target_ecs_target_subnets = var.prod-markets-private-subnets
#   event_target_ecs_target_security_groups = ["${var.all_traffic_prod_sg}"]
#   event_target_ecs_target_task_definition_arn = "arn:aws:ecs:${data.terraform_remote_state.global.outputs.aws_region}:${data.terraform_remote_state.global.outputs.aws_account_number}:task-definition/unique-job-name-01:1"
#   ecs_execution_task_role_arn                 = "arn:aws:iam::${data.terraform_remote_state.global.outputs.aws_account_number}:role/ecsTaskExecutionRole"
#   event_target_ecs_target_task_count          = 1
#   ecs_task_role_arn                           = aws_iam_role.unique-job-name-01.arn
# }

# resource "aws_iam_role" "unique-job-name-01" {
#   name = "unique-job-name-01-fargate"

#   # Terraform's "jsonencode" function converts a
#   # Terraform expression result to valid JSON syntax.
#   assume_role_policy = jsonencode({
#     "Version": "2008-10-17",
#     "Statement": [
#         {
#             "Sid": "",
#             "Effect": "Allow",
#             "Principal": {
#                 "Service": "ecs-tasks.amazonaws.com"
#             },
#             "Action": "sts:AssumeRole"
#         }
#     ]
#   })

#   tags = {
#     Name = "unique-job-name-01-fargate"
#   }
# }

# resource "aws_iam_role_policy_attachment" "unique-job-name-01-secrets" {
#   role       = aws_iam_role.unique-job-name-01.name
#   policy_arn = "arn:aws:iam::003659450078:policy/get-secret-value-base"
# }

# resource "aws_iam_role_policy_attachment" "unique-job-name-01-pass-role" {
#   role       = aws_iam_role.unique-job-name-01.name
#   policy_arn = "arn:aws:iam::003659450078:policy/passRoleToECS"
# }