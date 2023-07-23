variable "class" {
  default = "devops"
}
## print the same in capital letters
output "class" {
  value = upper(var.class)
}

