### A.Virtual host

> Virtual host dùng để nhúng toàn bộ các tên miền cùng chạy trên một webserver có IP cố định duy nhất.

### B.Cài đặt Virtualhost trên apache 

#### 1. Sau khi cài đặt và khởi động apache trên máy chủ. Ta kiểm tra truy cập từ bên ngoài vào máy chủ web bằng cách ping trực tiếp tới máy chủ.
- Nếu ping thành công sẽ hiện lên giao diện ..Testing 123....
- Nếu không ping được vào webserver thì có thể máy chủ Centos 7 sử dụng firewall -cmd chặn truy cập cổng 80(HTTP) và 443(HTTPS) từ bên ngoài.Ta sẽ phải sử dụng lệnh để cho phép truy cập tới 2 port này từ bên ngoài
```
	firewall-cmd --premanent --zone=public --add-service=http
	firewall-cmd --permanent --zone=public --add-service=https
	firewall-cmd --reload 
```
	- Sau đó thử connect lại với máy chủ.
#### 2. Cấu hình Virtual Hosts 

#### 2.1 Tạo thư mục cần thiết và phân quyền

- Tạo thư mục 
	- mkdir -p /var/www/test.com/pubic_html : chứa source code của website
	- mkdir -p /var/www/test.com/log : chứa các log của trang web
	- mkdir -p /var/www/test.com/backup : chứa file backup định kì hoặc file cấu hình
	
- Phần quyền
	- Phân lại quyền các thư mục vừa tạo từ root chuyển sang quyền của user apache hay chính là user quản trị website.
	- chown -R apache:apache /var/www/test.com 
	
#### 2.2 Tạo Virtrual Host 

1. Mở file vi/etc/httpd/conf/httpd.conf thêm dòng lệnh:
- NameVirtualHost *:80 
2. Tạo file test.conf (tên.conf) trong thư mục conf.d :
- touch ten.conf
3. Cấu hình file test.conf
```
	<VirtualHost *:80>
	ServerAdmin admin@test.com
	ServerName test.com
	ServerAlias www.test.com 
	DocumentRoot /var/www/test.com/public_html/	
	ErrorLog /var/www/test.com/log/error.log 
	CustomLog /var/log/www/test.com/log/access.log combined 
	</VirtualHost>
```
- VirtualHost *:80 : port 80 được dùng cho trang web 
- ServerAdmin : mail của quản trị website 
- ServerName : tên miền website người dùng gõ trên trình duyệt
- ServerAlias : một kiểu khác của tên miền . Được dùng để của hình www và non www 
- DocumentRoot : Đường dẫn tới thư mục chưa source code 
- ErrorLog : ghi lại log các lỗi phát sinh 
- CustomLog : ghi lại log các truy cập 

4. Test cài đặt
- Viết một file html trong thư mục public_html
- Cấu hình cho apache khởi động cùng máy chủ systemctl enable httpd 
- Dùng lệnh curl -I http://test.com (- i in hoa)


	
	
	




