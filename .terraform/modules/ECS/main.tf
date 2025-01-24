resource "aws_ecs_cluster" "main" {
  name = var.name
}

resource "aws_ecs_task_definition" "main" {
  family                   = var.name
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = var.cpu
  memory                   = var.memory
  task_role_arn            = var.iam_arn

  container_definitions = jsonencode([
    {
      name      = "main"
      image     = local.full_image
      essential = true
      portMappings = [
        {
          containerPort = var.port
          hostPort      = var.port
          protocol      = "tcp"
        }
      ]
      environment = [
        {
          "name"  = "PORT"
          "value" = tostring(var.port)
        },
        {
          "name"  = "BUCKET_NAME"
          "value" = var.bucket_name
        }
      ]
    }
  ])
}

resource "aws_ecs_service" "main" {
  name            = "main"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.main.arn
  desired_count   = var.replicas
  launch_type     = "FARGATE"

  network_configuration {
    subnets          = [var.subnet_id]
    security_groups  = [var.security_group_id]
    assign_public_ip = true
  }
}