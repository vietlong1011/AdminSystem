### Note : Lấy mật khẩu root trước khi tạo tài khoản root dùng lệnh
`grep "A temporary password" /var/log/mysqld.log`
##### Sinh ra pasword root. Nhập password và tạo mk cực mạnh 


### A.Tạo tài khoản root trong MySQL

> Để thực hiện lệnh , người dùng phải đăng nhập bằng tài khoản root của MySQL  hoặc một user có full quyền 

####  Các bước tạo tài khoản root trong MySQL 
1. ` mysql_secure_installation `

2. Sau đó hệ thống sẽ yều bạn thực hiện các bước bên dưới . 
- Enter current password for root (enter for none): là nhập mật khẩu hiện tại của root hiện tại nó chưa có thì chúng ta chỉ cần enter qua
- Set root password ? [Y/n] : Đặt mật khẩu cho root
- Remove anonymous users? [Y/n] Xóa người dùng ẩn danh
- Disallow root login remotely? [Y/n] : Không cho phép đăng nhập root từ xa
- Remove test database and access to it? [Y/n] : Xóa và kiểm tra cơ sở dữ liệu và đăng nhập vào nó
- Reload privilege tables now? [Y/n] : Tải lại bảng đặc quyền ngay bây giờ

3. Để dùng quyền root truy cập vào mysql

` mysql -u root -p ` 

### B. Tạo các user người dùng

1. Phải truy cập vào mysql bằng quyền `root ` 
` mysql -u root -p `

2. Tạo user bằng câu lệnh: 

` CREAT USER 'user-name'@'localhost' IDENTIFIED BY 'password'; `

- user-name : tên user bạn muốn tạo 
- localhost : user chỉ được phép truy cập mysql từ localhost , dùng % để cho phép user truy cập từ bất kì máy nào trong hệ thống.
- password : mật khẩu của user 
- kết thúc mỗi câu lênh mysql đều phải có dấu ; hoặc /g 

### C. Phân quyền cho các user 
#### 1.Cú pháp cấu quyền cho user có cấu trúc

` GRANT [loại quyền] ON [Tên database].[tên table] TO 'username'@'localhost'; `

1. Loại quyền 
	- ALL PRIVILEGES : Có tất cả các quyền 
	- CREATE : quyền tạo DB hoặc Table 
	- DROP : quyền xóa DB hoặc Table
	- INSERT : Chèn dữ liệu theo row và tabe 
	- DELETE : Xóa dữ liệu theo row từ table
	- SELECT : Truy vấn được cơ sở dữ liệu 
	- UPDATE : Cho phép cập nhật các hàng của table 
	- GRANT OPTION : Cho phép xóa hoặc cấp quyền cho người dùng khác.
2. Tên database hoặc tên table để ` * ` cố nghĩa là sẽ cho user được truy cập tới mọi DB và mọi Tabe trong DB đó.

#### 2. Để các thay đổi trên có tác dụng thì dùng lệnh:

` FLUSH PRIVILEGES; ` 


#### 3. Thu hồi quyền của user

1. Thu hồi quyền của user
` REVOKE [loại quyền] ON[database].[table] FROM 'username'@'localhost'; `

2. Xóa user 
` DROP USER 'user-name'@'localhost'; `


### D. Xem các user có trong MySQL 

` SELECT user, host FROM mysql.user ; `

- Xem các quyền được cấp cho user 

` SHOW GRANTS FOR  name_user@host `

### REMOTE DB từ máy khác.
`mysql -u user -p -hip` 
- vd: mysql -u user -p h10.2.9.50.
- ip là ip DB-server mà ta cần truy cập tới. 














