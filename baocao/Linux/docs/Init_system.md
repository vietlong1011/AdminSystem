### 1.Init system

- Init system dùng quản lý hệ thống và có ba kiểu triển khai init system trong linux
	- System V (đọc là System Five ) : Là bản truyền thống của init system trong nhiều hệ thống linux
	- Upstart : được sử dụng trong bản Ubuntu cũ hơn 15.04
	- Systemd : Là một init system được triển khai 2010 được làm init system mặc định cho cho CenOS từ bản 7 và Ubuntu từ bản 15.04
### 2. Các thành phần của init system (Systemd).
##### Systemd tương đương với một chương trình quản lý hệ thống và các dịch vụ trong linux. Systemd cung cấp một số tiện ích sau:
- `systemctl` : Quản lý trạng thái hoạt động của các dịch vụ hệ thống (start , stop , restart , status...)
- `journald`  : Dùng để quản lý hoạt động của hệ thống ( hay còn gọi là ghi log).
- `logind`    : Dùng quản lý đăng suất người dùng.
- `networkd`  : Dùng để quản lý các kết nối mạng thông qua các cấu hình mạng.
- `timedated` : Dùng để quản lý thời gian hệ thống hoặc thời gian mạng.
- `udev`      : Dùng để quản lý các thiết bị và firmware.
### 3. Unit file 
##### Tất cả các chương trình được quản lý bởi Systemd đều được thực thi dưới dạng `deamon` hay `backgroud` bên dưới và được cấu hình thành 1
file confinguration gọi là ` UNIT file` . Các unit file này gồm 12 loại:
- service : các file quản lý của chương trình.
- socket : quản lý các kết nối.
- mount : gắn thiết bị
- automount : Tự đọng găn thiết bị 
- swap : vùng không gian bộ nhớ trên đĩa cứng
- target : quản lý tạo liên kết.
- path : quản lý đường dẫn
- timer : dùng cho cron job để lập lịch 
- snapshot : sao lưu
- slice : Dùng để quản lý tiến trình
- scope : quy định không gian hoạt động
### 4. Service
##### Các service được cấu hình trong các file riêng biệt và được quản lý thông qua câu lệnh ` systemctl` . Các tùy trọn trong systemctl :
- start : bật service
- stop	: ngừng dịch vụ
- restart : khởi động lại dịch vụ
	- reload : tải file cấu hình tuy nhiên chỉ có một số chương trình hỗ trợ như Apache /Nginx..
- enable : service khởi động cùng hệ thống
- disable : service không được khởi động cùng hệ thống.