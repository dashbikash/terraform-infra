resource "aws_docdb_cluster" "bikash_docdb_cluster" {
    cluster_identifier      = "bikash-docdb-cluster"
    engine                  = "docdb"
    master_username         = "docdbadmin"
    master_password         = "ChangeMe12345!"
    backup_retention_period = 1
    skip_final_snapshot     = true
}

resource "aws_docdb_cluster_instance" "bikash_docdb_cluster" {
    identifier         = "free-tier-docdb-instance"
    cluster_identifier = aws_docdb_cluster.free_tier.id
    instance_class     = "db.t2.micro" # Smallest supported for DocumentDB
    engine            = "docdb"
}

resource "aws_docdb_subnet_group" "default" {
    name       = "free-tier-docdb-subnet-group"
    subnet_ids = local.subnets
}