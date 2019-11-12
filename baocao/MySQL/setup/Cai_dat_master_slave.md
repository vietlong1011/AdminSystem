### 1. Xây dựng LAB  Master-Slave
- Sử dụng 2 server , 1 server giữ vai trò server Master và 1 server giữ vai trò server Slave
- Cài đặt MySQL bản 8. trở lên.
	- IP server-Master: 10.2.9.50
	- IP server-Slave : 10.2.9.51

### 2. Cài đặt
- Thực hiện cài đặt MySQL bản 8. trên cả 2 máy.

### 2.1 Cài đặt trên Server-Master
#### 2.1.1 Thực hiện cấu hình trong ` /etc/my.cnf` với nội dung
```
bind-address = 10.2.9.50
server-id = 1
log_bin = mysql-bin
```
- Trong đó: 
	- bind-address : đây là địa chỉ server chứ DB cần kết nối
	- server-id : mỗi một server sẽ có một id riêng
	- log_bin : Tên của binlog (nơi ghi toàn bộ thay đổi dữ liệu của master-server)

#### 2.1.2 Khởi động lại dịch vụ mysql
- `systemctl restart mysqld`

#### 2.1.3 Đăng nhập tài khoản root 
- ` mysql -u root -p`

#### 2.1.4 Tạo tài khoản truy cập từ Slave và cấp quyền.
```
Create user 'h1'@'10.2.9.51' identified by 'Hse@12345'
Grant all privileges on *.* to 'h1'@'10.2.9.51'
Grant Replication Slave on *.* to 'h1'@'10.2.9.51'
```

#### 2.1.5 Lấy thông tin về tên file và Position
```
mysql > show master status\G

*************************** 1. row ***************************
             File: mysql-bin.000001
         Position: 1427
     Binlog_Do_DB: 
 Binlog_Ignore_DB: 
Executed_Gtid_Set: 
1 row in set (0.00 sec)
```
### 2.2 Cài đặt trên Master-Slave
#### 2.2.1 Thực hiện cấu hình trong ` /etc/my.cnf` với nội dung
```
bind-address           = 10.2.9.51
server-id              = 2
log_bin                = mysql-bin
```
- Trong đó: 
	- bind-address : đây là địa chỉ server chứ DB cần kết nối
	- server-id : mỗi một server sẽ có một id riêng
	- log_bin : Tên của binlog (nơi ghi toàn bộ thay đổi dữ liệu của master-server)
#### 2.2.2 Khởi động lại dịch vụ mysql
- `systemctl restart mysqld`

#### 2.2.3 Đăng nhập tài khoản root 
- ` mysql -u root -p`

#### 2.2.4 Dừng Slave Threads
- `mysql> STOP SLAVE`

#### 2.2.5 Cấu hình các câu lệnh vào MySQL
```
Mysql>	CHANGE MASTER TO
	MASTER_HOST='10.2.9.50',
	MASTER_USER='h1',
	MASTER_PASSWORD='Hse@12345',
	MASTER_LOG_FILE='mysql-bin.000001',
	MASTER_LOG_POS=1427;
```
- Trong đó :
	- Host: địa chỉ IP server Master chứa DB.
	- User: tên user cài tạo ở Master và gán quyền truy cập ở Slave
	- Password: Mật khẩu của của user
	- Log_file : Tên binlog ( tên trong master tạo ra)
	- Pos: hình như là phân vùng trong /var/lib/mysql

#### 2.2.6 Bật lai Slave
` mysql> START SLAVE `

### 3.Test 