locals {
  # Define the VPC ID as a local variable
  vpc_id         = "vpc-3af53251"                                                                       # Replace with your actual VPC ID
  subnets        = ["subnet-04a6a9f4160aa57ba", "subnet-0ed22eb41f7a7f0f9", "subnet-090aa1d627f06374c"] # Replace with your actual subnet IDs
  mysql_dbname   = "mydb"                                                                               # Replace with your actual MySQL database name
  mysql_username = "root"                                                                               # Replace with your actual MySQL username
  mysql_password = "root"                                                                               # Replace with your actual MySQL password
}