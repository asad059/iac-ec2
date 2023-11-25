provider "aws" {
  region = "us-east-1"  # Change this to your desired AWS region
}

resource "aws_instance" "my_instance" {
  ami           = "ami-05a5f6298acdb05b6"  # Red Hat Enterprise Linux 8 (HVM)
  instance_type = "t2.micro"
  key_name      = "linux"
  subnet_id     = aws_default_subnet.default.id
  vpc_security_group_ids = ["${aws_security_group.my_sg.id}"]

  private_ip    = "172.31.7.90"  # Fixed private IP

  tags = {
    Name = "MyEC2Instance"
  }
}
resource "aws_default_subnet" "default" {
  availability_zone = "us-east-1c"

  tags = {
    Name = "Default subnet for us-west-2a"
  }
}


resource "aws_security_group" "my_sg" {
  name        = "my-security-group"
  description = "Allow inbound SSH (22) and HTTP (80) traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}



output "public_ip" {
  value = aws_instance.my_instance.public_ip
}

output "private_ip" {
  value = aws_instance.my_instance.private_ip
}
