variable "sample" {
  default = 100
}

variable "sample1" {
  default = "output in quotes"
}

output "sample" {
  value = "var.sample"
}

output "sample1" {
  value = "var.sample1"
}

# variable/any other reference need to be accessed with some other string then need to be accessed through ${}

output "sample_ext" {
  value = "value of sample and sample1 are ${var.sample} and ${var.sample1}"
}