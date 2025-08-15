
resource "aws_security_group" "example_sg" {
  name        = "example-security-group"
  description = "Allows HTTP and SSH traffic"
  
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow HTTP traffic from anywhere"
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow SSH traffic from anywhere"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # All protocols
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }

  tags = {
    Name = "example-sg"
  }
}

resource "aws_instance" "terraform" {
    count = length(var.instance_name)
    ami = var.ami_id
    tags = { 
        Name = "${element(var.instance_name, count.index)}"
         }
    instance_type = element(var.instance_name, count.index) == "terraform1" ? "t2.micro" : "t3.micro"

}