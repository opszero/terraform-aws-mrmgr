module "aws_oidc_gitlab" {

  for_each = var.gitlab
  source   = "git::https://github.com/abhiyerra/terraform-aws-oidc-gitlab.git?ref=main"


  attach_admin_policy  = false
  create_oidc_provider = true
  iam_role_name        = each.value.iam_role_name
  iam_policy_arns      = each.value.policy_arns
  gitlab_url           = each.value.gitlab_url
  audience             = each.value.audience
  match_field          = each.value.match_field
  match_value          = each.value.match_value
}
