﻿### A.Giới thiệu MySQL 

> MySQL là database mã nguồn mở và miễn phí.

1. Tương quan giữa MySQL và SQL server :
> Mặc dù được phát triển từ SQL nhưng syntax giữa SQL server mà MySQL là khá lớn.


1.1 Điểm tương đồng :
- MySQL và SQL server đều được phát triển dựa trên SQL.

1.2 Đặc trưng riêng của MySQL và SQL server 
- MySQL là mã nguồn mở, miễn phí nên cực kì phổ biến với các lập trình viên, và thường được sử dụng trong lập trình web.
	- Trong lập trình web MySQL được dùng kết hợp đồng thời với PHP , Apache Web Server , distro của Linux ( LAMP )
	- MySQL sẽ hoạt động tốt hơn trên OS LINUX.

- SQL server đươc Microsoft phát triển từ SQL và có trước khi MySQL ra đời. 
	- SQL hoạt động tốt với .NET 
	
### B. Cài đặt MySQL trên Centos 7 


#### 1. Update hệ thống 
` yum update `

#### 2. Cài wget
` yum install wget `

#### 3. Tải MySQL repo ( repository )
- Các phiên bản của MySQL repository được lưu trong :https://repo.mysql.com/

- Tải MySQL repository : 
`  wget http://dev.mysql.com/get/mysql57-community-release-el7-9.noarch.rpm `

- Tạo repostory cho MySQL 
` rpm -ivh ( iph ?) mysql57-communuty-release-el7-9.noarch.rpm `

#### 4.Cài MySQL trên server 

` yum install mysql-server `

#### 5.Kiểm tra và khởi động MySQL
- Khởi động MySQL
	` systemctl restart mysqld `
- Kiểm tra trạng thái MySQL
	` systemctl status mysqld `



