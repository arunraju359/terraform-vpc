resource "aws_subnet" "private" {
  count      =  length(var.PRIVATE_SUBNET_CIDR)
  vpc_id     = aws_vpc.main.id
  cidr_block = element(var.PRIVATE_SUBNET_CIDR, count.index)

  tags = {
     Name = "${var.PROJECTNAME}-${var.ENV}-private-subnet-${count.index+1}"
  }
}


resource "aws_subnet" "public" {
  count                    =  length(var.PUBLIC_SUBNET_CIDR)
  vpc_id                   = aws_vpc.main.id
  cidr_block               = element(var.PUBLIC_SUBNET_CIDR, count.index)
  map_public_ip_on_launch  = true

  tags = {
    Name =  "${var.PROJECTNAME}-${var.ENV}-public-subnet-${count.index+1}"
  }
}

