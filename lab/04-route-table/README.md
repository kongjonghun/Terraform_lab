# Info
Terraform VPC Route Table Example

![](./img/04-route-table-diagram.png)

* VPC CIDR 은 10.0.0.0/16 
* Subnet CIDR 은 10.X.0.0/24 
* Subnet 은 본인이 선택한 Region 의 Availability Zone 수 만큼 생성 (ex. us-east-1 -> 4 Availability Zones -> 4 Subnets)
* 각 Availability Zone 별로 Public Subnet, Private Subnet 페어로 한개씩 존재하도록 생성
* Internet Gateway 생성 후 VPC 에 Attach
* Route Table 은 Public 과 Private Route Table 한개씩 총 2개 생성
* Public Route Table 은 Internet Gateway 로 통신 가능하도록 Route 추가 후 Public Subnet 4개와 연결 (Associatation)
* Private Route Table 은 Route 추가 없이 Private Subnet 4개와 연결 (Associatation)


# Step

## 1. 변수 설정
route_table.tfvars 파일 확인 
실행 환경에 맞게 변경  

```
# route_table.tfvars 파일

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
```
* Prefix 는 알맞게 변경
* Region 은 본인이 사용할 region 코드로 변경
* Subnet 의 Availability Zone 값은 Region 에 맞게 변경


## 2. init  
Init 명령으로 Terraform 수행을 위한 provider plugin 초기화 및 다운로드 수행

```
terraform init
```

## 3. plan  
Plan 명령으로 Terraform 수행 전 실행 시뮬레이션 확인
```
terraform plan --var-file=route_table.tfvars
```  

## 4. apply  
Apply 명령으로 Terraform 을 통한 Resource 생성 수행
```
terraform apply --var-file=route_table.tfvars
```  

## 5. 실행 내용 확인
선택한 Region 에 VPC, Subnet, Internet Gateway, Route Table 생성 내용 확인 


# Resource 삭제

## 1. destroy
Destroy 명령으로 생성된 VPC 삭제 수행
```
terraform destroy --var-file=route_table.tfvars
```
