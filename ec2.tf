resource "aws_instance" "terraform"{
    ami = "ami-0dfc569a8686b9320"
    instance_type = "t2.micro"
}
