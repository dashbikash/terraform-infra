locals {
  # Define the VPC ID as a local variable
  vpc_id  = "vpc-02bcc97f32732ccfb" # Replace with your actual VPC ID
  subnets = ["subnet-0deec8a6a1040cebe", "subnet-098e9aac03cfdb725", "subnet-0740531d05bbea4b6"]
  mysql_dbname   = "mydb"                                                                               # Replace with your actual MySQL database name
  mysql_username = "root"                                                                               # Replace with your actual MySQL username
  mysql_password = "12345678"     
}