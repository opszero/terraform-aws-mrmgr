resource "aws_iam_role" "administrator" {
  name = "opsZeroIAM-Administrator"

  # TODO Define what can assume this role
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    terraform = "true"
  }
}

resource "aws_iam_role" "developer" {
  name = "opsZeroIAM-Developer"

  # TODO Define what can assume this role
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    terraform = "true"
  }
}

resource "aws_iam_role" "readonly" {
  name = "opsZeroIAM-ReadOnly"

  # TODO Define what can assume this role
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    terraform = "true"
  }
}

resource "aws_iam_role" "monitoring" {
  name = "opsZeroIAM-Monitoring"

  # TODO Define what can assume this role
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    terraform = "true"
  }
}

resource "aws_iam_role_policy_attachment" "administrator2fa" {
  role       = aws_iam_role.administrator.name
  policy_arn = aws_iam_policy.opszero-2fa-policy.arn
}

resource "aws_iam_role_policy_attachment" "developer2fa" {
  role       = aws_iam_role.developer.name
  policy_arn = aws_iam_policy.opszero-2fa-policy.arn
}

resource "aws_iam_role_policy_attachment" "readonly2fa" {
  role       = aws_iam_role.readonly.name
  policy_arn = aws_iam_policy.opszero-2fa-policy.arn
}

# TODO Remove if not required for monitoring role/user
resource "aws_iam_role_policy_attachment" "monitoring2fa" {
  role       = aws_iam_role.monitoring.name
  policy_arn = aws_iam_policy.opszero-2fa-policy.arn
}

resource "aws_iam_role_policy_attachment" "administrator" {
  role       = aws_iam_role.administrator.name
  policy_arn = aws_iam_policy.opszero_admin.arn
}

resource "aws_iam_role_policy_attachment" "developer" {
  role       = aws_iam_role.developer.name
  policy_arn = aws_iam_policy.opszero_developer.arn
}

resource "aws_iam_role_policy_attachment" "readonly" {
  role       = aws_iam_role.readonly.name
  policy_arn = aws_iam_policy.opszero_readonly.arn
}

# TODO Remove if not required for monitoring role/user
resource "aws_iam_role_policy_attachment" "monitoring" {
  role       = aws_iam_role.monitoring.name
  policy_arn = aws_iam_policy.opszero_monitoring.arn
}
