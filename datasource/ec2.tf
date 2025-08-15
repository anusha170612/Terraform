resource "aws_instance" "terraform" {
    count = length(var.instance_name)
    ami = data.aws_ami.rhel.id
    instance_type = element(var.instance_name, count.index) == "terraform1" ? "t2.micro" : "t3.micro"
    vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]

     tags = {
    Name = "${element(var.instance_name, count.index)}"
      }
}

resource "aws_security_group" "allow_ssh_terraform"{
    name = "allow_ssh_terraform"
    description = "this is new security group"
    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    ingress {
        from_port        = 22
        to_port          = 22
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"] #allow from everyone
        ipv6_cidr_blocks = ["::/0"]
    }
}

 