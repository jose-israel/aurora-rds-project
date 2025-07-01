variable "region" {
  default = "us-east-1"
}
variable "cluster_id" {
  default = "myy-cluster-aurora"
}
variable "db_username" {
  default = "admin"
}
variable "db_password" {
  description = "Contraseña del RDS"
  type        = string
  sensitive   = true
}
variable "db_name" {
  default = "base-de-datos-g2"
}
variable "subnet_ids" {
  type = list(string)
}
variable "vpc_id" {
  type = string
}
variable "aws_access_key" {
  type = string
}
variable "aws_secret_key" {
  type = string
}
