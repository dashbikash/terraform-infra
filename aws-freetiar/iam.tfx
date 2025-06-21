
resource "aws_iam_user" "readonly_user" {
  name = "readonly-user"
}

resource "aws_iam_user_policy_attachment" "readonly_policy_attachment" {
  user       = aws_iam_user.readonly_user.name
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}

resource "aws_iam_access_key" "readonly_user_key" {
  user = aws_iam_user.readonly_user.name
}

resource "local_file" "readonly_user_credentials" {
  content  = <<EOF
        AWS_ACCESS_KEY_ID=     ${aws_iam_access_key.readonly_user_key.id}
        AWS_SECRET_ACCESS_KEY= ${aws_iam_access_key.readonly_user_key.secret}
        EOF
  filename = "${path.module}/readonly_user_credentials.txt"
}