resource "aws_instance" "main" {
  ami = var.ami_id
  instance_type = var.instance_type
  count = var.ec2_count
  subnet_id = var.subnet_id
    metadata_options {
    http_tokens = "required"
  }
  root_block_device {
    encrypted = true
  }
 tags = {
    Name = "Server ${count.index + 1}"
  }
}

resource "aws_kms_key" "Encryption_key" {
  enable_key_rotation = true
}

resource "aws_ebs_volume" "ebs1" {
  availability_zone = "ap-south-1a"
  size              = 10

  kms_key_id = aws_kms_key.Encryption_key.arn

  tags = {
    Name = "ebsvolume1"
  }
  encrypted = true
}
resource "aws_volume_attachment" "ebs_att1" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.ebs1.id
  instance_id = var.instance_id
}

## Volume two for ec2_two   
resource "aws_ebs_volume" "ebs2" {
  availability_zone = "ap-south-1a"
  size              = 10

  kms_key_id = aws_kms_key.Encryption_key.arn

  tags = {
    Name = "ebsvolume2"
  }
  encrypted = true
}

resource "aws_volume_attachment" "ebs_att2" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.ebs2.id
  instance_id = var.instance_id
}