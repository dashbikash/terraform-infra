
resource "aws_iam_user" "readonly_user" {
    name = "readonly-user"
}

resource "aws_iam_user_policy_attachment" "readonly_policy_attachment" {
    user = aws_iam_user.readonly_user.name
    policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}
