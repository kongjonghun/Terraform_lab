prefix              =       "user**"
region              =       "ap-northeast-2"
vpc_cidr            =       "10.0.0.0/16"

public_subnets      =       [
    {cidr = "10.0.1.0/24", availability_zone = "ap-northeast-2a"},
    {cidr = "10.0.3.0/24", availability_zone = "ap-northeast-2c"},
    ]

private_subnets = [
    {cidr = "10.0.11.0/24", availability_zone = "ap-northeast-2a"},
    {cidr = "10.0.13.0/24", availability_zone = "ap-northeast-2c"},
]

admin_access_cidrs          =   ["116.127.84.104/32"]
ami_id                      =   "<<YOUR_AMI_ID>>"
data_vol_snapshot_id        =   "<<DATA_VOLUME_SNAPSHOT_ID>>"
data_volume_size            =   "10"
instance_type               =   "t3.micro"
keypair_name                =   "user**-key"

port                        =   "80"
protocol                    =   "HTTP"