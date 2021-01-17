data "aws_ami" "ubuntu"{
    most_recent = true

    filter {
        name = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
    }
    owners = ["099720109477"] #Ubuntu
}
data "aws_ami" "ubuntu_west"{
    most_recent = true
    provider = aws.west
    filter {
        name = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
    }
    owners = ["099720109477"] #Ubuntu
}

resource "aws_instance" "web" {
    ami           = data.aws_ami.ubuntu.id
    instance_type = "t2.micro"

    tags = {
        Name = "helloworld"
    }
}
resource "aws_instance" "web_west" {
    ami           = data.aws_ami.ubuntu_west.id
    instance_type = "t2.micro"
    provider = aws.west
    tags = {
        Name = "helloworld"
    }
}