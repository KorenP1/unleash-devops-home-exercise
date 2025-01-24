resource "aws_iam_role" "main" {
  name = "${var.iam_name}-s3-getobject-access"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy" "main" {
  name = "s3-getobject-access"
  role = aws_iam_role.main.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = ["s3:ListBucket", "s3:GetObject", "s3:GetObjectAttributes"]
        Effect   = "Allow"
        Resource = var.bucket_arn
      }
    ]
  })
}