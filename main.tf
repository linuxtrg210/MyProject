locals {
	region = "ap-south-1"
}

provider "aws" {
	region = local.region
    access_key      = "AKIAZ6R5EWHMGXMXQKOV"
    secret_key      = "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"
}

resource "aws_instance" "inst1" {
	ami = "ami-0f9d9a251c1a44858"
    instance_type   = "t2.micro"
    key_name        = "tf_windows_ed25519_kp"
    vpc_security_group_ids = ["sg-0a2e802bf1f0081c8"]
    tags            = {
    Name    = "Terraform"
    }
}

output "inst1_privip" {
    value = "${aws_instance.inst1.private_ip}"
}

output "inst1_pubip" {
    value = "${aws_instance.inst1.public_ip}"
}

output "inst1_id" {
    value = "${aws_instance.inst1.id}"
}

output "inst1_key" {
    value = "${aws_instance.inst1.key_name}"
}

output "inst1_subnetid" {
    value = "${aws_instance.inst1.subnet_id}"
}