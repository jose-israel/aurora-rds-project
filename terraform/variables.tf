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
  default = "grupo2"
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
