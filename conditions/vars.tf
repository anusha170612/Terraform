variable "instance_name" {
    type = list(string)
    default = ["terraform1" , "terraform2"]
}

variable "ami_id" {
    type = string
    default = "ami-0dfc569a8686b9320"
}