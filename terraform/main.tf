resource "aws_rds_cluster" "aurora_cluster" {
  cluster_identifier      = var.cluster_id
  engine                  = "aurora-mysql"
  engine_version          = "5.7.mysql_aurora.2.10.2"
  master_username         = var.db_username
  master_password         = var.db_password
  skip_final_snapshot     = true
  database_name           = var.db_name
  vpc_security_group_ids  = [aws_security_group.aurora_sg.id]
  db_subnet_group_name    = aws_db_subnet_group.aurora_subnet.name
}

resource "aws_rds_cluster_instance" "aurora_instance" {
  count              = 1
  identifier         = "${var.cluster_id}-instance-${count.index + 1}"
  cluster_identifier = aws_rds_cluster.aurora_cluster.id
  instance_class     = "db.t3.medium"
  engine             = aws_rds_cluster.aurora_cluster.engine
}

resource "aws_db_subnet_group" "aurora_subnet" {
  name       = "aurora-subnet-group"
  subnet_ids = var.subnet_ids
}

resource "aws_security_group" "aurora_sg" {
  name        = "aurora-sg"
  description = "Allow MySQL access"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Cámbialo luego a tu IP o rango privado
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
