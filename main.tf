provider "aws" {
  region = "eu-north-1"
}

resource "aws_key_pair" "dev_key" {
  key_name   = "dev-key"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_security_group" "strapi_sg" {
  name        = "strapi-sg-N"
  description = "Allow SSH and Strapi ports"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 1337
    to_port     = 1337
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Consider using your IP for security
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "StrapiSecurityGroup"
  }
}

resource "aws_instance" "strapi_ec2" {
  ami                         = "ami-05fcfb9614772f051"
  instance_type               = "t3.medium"
  key_name                    = aws_key_pair.dev_key.key_name
  associate_public_ip_address = true

  vpc_security_group_ids = [aws_security_group.strapi_sg.id]

  user_data = file("${path.module}/user-data.sh")

  tags = {
    Name = "StrapiAppServer"
  }

  provisioner "remote-exec" {
    inline = ["echo EC2 with Amazon Linux is ready!"]

    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("~/.ssh/id_rsa")
      host        = self.public_ip
    }
  }
}

