resource "aws_instance" "terraform2"{
ami = var.ami_id
instance_type = var.instance_type
vpc_security_group_ids = [aws_security_group.example_sg.id]

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