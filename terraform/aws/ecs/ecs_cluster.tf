resource "aws_ecs_cluster" "ECS-cluster-01" {
  name = var.ecs_cluster_name

  setting {
    name  = "containerInsights"
    value = "disabled"
  }
}
