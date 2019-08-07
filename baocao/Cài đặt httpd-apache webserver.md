### Cài đặt HTTPD-APACHE webserver trên Centos 7
1. Cài đặt
	- yum install -y httpd
2. Khởi động và kích hoạt 
	- systemctl restart httpd
	- systemctl enable httpd
3. Xác nhận khởi động thành công
	- ps aux|grep httpd
