# output "ec2_private_key_path" {
#   value     = format("Key Path: %s (Copy this file to your local machine and set permissions to 0600)", local_file.ec2-key-pair-private-key.filename)
#   sensitive = false
# }

# output "rds_endpoint" {
#   value = aws_db_instance.rds_mysql.endpoint
# }

# output "rds_instance_id" {
#   value = aws_db_instance.rds_mysql.id
# }

# output "rds_instance_status" {
#   value = aws_db_instance.rds_mysql.status
# }

