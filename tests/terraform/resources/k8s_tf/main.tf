resource "aws_subnet" "eks_subnet" {
  vpc_id                  = var.vpc_id
  cidr_block              = "10.10.10.10/24"
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = true
  tags = {
    Name                                    = "${local.prefix}-eks-subnet-1"
    "kubernetes.io/cluster/${local.prefix}" = "shared"
    yor_trace                               = "bcda90db-1625-4f54-bd40-d0c63ae1d8d4"
  }
}