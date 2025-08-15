resource "aws_instance" "terraform"{
  ami = "ami-0dfc569a8686b9320"
  instance_type = "t2.micro"
  tags = {
    Name = "Terraform1"
  }
}

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