### 1.Log file trong linux 

> Trong hệ thống linux, các file log được cài đặt trong thư mục /var/log. Bất kì ứng dụng, dịch vụ nào ta cài vào hệ thống ta có thể tạo ra file log của chúng tại /var/log . Dùng ls -l/var/log để xem thư mục này.

1. Các log chính có trong thư mục :
- var/log/message : Chứa toàn bộ các thông báo, bao gồm các thông báo khi khởi động hệ thống
- var/log/cron : chứa dữ liệu log của cron deamon . Bắt đầu và dừng cron cũng như cron job thất bại 
- var/log/maillog hoặc var/log/mail.log : Thông tin log từ các máy chủ mail chạy trên máy chủ 
- var/log/wtmp : Chứa tất cả lịch sử đăng nhập và đăng xuất.
- var/log/btmp : Thông tin đăng nhập không thành công.
- var/log/utmp : Thông tin log trạng thái đăng nhập hiện tại của người dùng.
- var/log/dmesg : Giống log message nhưng nhưng chủ yếu là log bộ đệm 
- var/log/secure : Log bảo mật 
- var/log/mariadb : Nếu mariaDB được cài đặt trên hệ thống thì đây là vị trí tập tin log được lưu lại 
- var/log/mysql : Nếu csdl được cài đặt thì đây là thư mục log mặc định.

2. Tập tin log cụ thể trên os 

- CentOS 
	- var/log/yum.log : Lưu trữ các log của Yum package manager 
	- var/log/http : Lưu trữ các log mặc định của máy chủ Web Apache
- Ubuntu 
	- var/log/apache2 : Thông tin log của máy của web Apache
	- var/log/apt : Lưu trữ log của ubunto package management 

### 2.Log file trong CentOS 7

1. Xem file log trên CentOS 

- more -f /var/log/message
- tail -n 20 /var/log/message 
