#---------------------------------------------------
#My Terraform
# Build Web Serv during bootstrap_action
#
#mode by Ivan Biriukiv
#------------------------------------------------

provider "aws" {
  access_key = "AKIAVK7TWSMMZOAKO4Q5"
  secret_key = "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"
  region     = "eu-central-1"
}
resource "aws_eip" "my_static_ip" {
  instance = aws_instance.my_webserver.id
}

resource "aws_instance" "my_webserver" {
  ami                    = "ami-043097594a7df80ec"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.my_webserver.id]
  #user_data              = file("user_data.sh")

  user_data = templatefile("user_data.sh.tpl", {
    f_name = "Ivan",
    l_name = "Biriukov",
    names  = ["Vasya", "Kolya"]
  })

  tags = {
    Name  = "Web Server Build by Terraform"
    owner = "Ivan Biriukov"
  }
}

resource "aws_security_group" "my_webserver" {
  name        = "WebServer Security Group"
  description = "My first SecurityGroup"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name  = "Web Server SecuritiGroup"
    owner = "Ivan Biriukov"
  }
}
output "webserver_instance_id" {
  value = aws_instance.my_webserver.id
}
