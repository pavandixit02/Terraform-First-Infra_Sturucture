provider "aws" {
    region = "eu-north-1"
}

resource "aws_instance" "my_first_ec2"{
    ami = "ami-021aaf3749be66813"
    instance_type = "t3.micro"
    tags = {
        Name = "MyFirstTerraformEC2"
    }
}