### Cấu trúc thư mục trong Linux
> Hệ thống tập tin trong Linxu được tổ chức theo một hệ thống phân bặc tương tự cấu trúc của một cây phân cấp. Bậc cao nhất của hệ thông tập tin là thư mục gốc , được ký hiệu bắc "/" (root derectory) .
 

1. /Root
- Mở tập tin và thư mục từ thư mục Root
- Chỉ có root user mới có quyền viết thư mục này 
- /root là thư mục gốc của Root user

2. /bin : user binaries 

- Chứa các tập tin thực thi nhị phân 
- Tất cả user nằm ở thư mục này đề có thể sử dụng lệnh 
- Lênh linux sử dụng phổ biến ở chế độ singer-user mode nằm ở chế độ này. Chế độ người dùng đơn (singer-user mode) là một trong những cấp độ chạy run level trong linux .
- vd: ps ls ping grep cp .

3. /sbin : system binaries 

- Cũng chứa các tập tin nhị phân giống như /bin
- Admin hệ thống mới sử dụng được lệnh trong thư mục này , nhằm mục đích duy trì hệ thống.
- vd: iptables reboot fdisk ifconfig swapon.

4. /etc : configuration file 

- Chứa cấu hình các tập tin của hệ thống , các tập tin khởi động dịch vụ của hệ thống 
- Ngoài ra /etc còn chứa shell startup và shutdown để chạy và ngừng các chương trình cá nhân. 
- vd: /etc/resolv.conf

5. /dev : file device 

- Chứa các tập tin để nhận biết các thiết bị cho hệ thống . 
- vd: /dev/ty1/dev/usbmon0.

6. /var : variable file 

- Ghi lại các tập tin và các biến đổi .
- Nội dung các tập tin sẽ tăng dần lên :
	- Hệ thống tập tin log ( /var/log)
	- Các gói tin và file dữ liệu (/var/lib/)
	- Email (/var/email/)
	- print queues (/var/spool/) 
	- Lock file (/var/lock/)
	- Các file tạm thời khi reboot (/var/tmp/) 

7. /proc : process information 

- Chứa thông tin về process system 
- Hệ thống tập tin ảo chứa thông tin về tài nguyên của hệ thống  và thông tin về các quá trình đang chạy .

8. /tmp : Temporaty file ( hệ thống file tạm thời ) 
- Thư mục chứa các tập tin tạm thơi được hệ thống và user sinh ra.
- Các tập tin này sẽ bị xóa khi hệ thống khởi động lại 

9. /usr : user programs 

- Chứa các ứng dụng , thư viện, tài liệu và mã nguồn các chương trình thứ cấp. 
- /usr/bin : chứa các tập tin chính của ứng dụng đã được cài cho user .
- /usr/sbin : Chứa các tập tin của ứng dụng cho Admin của hệ thống
- /usr/lib : chứa thư viện usr/bin và usr/sbin 
- /usr/local : chứa các chương trình user mà ta cài từ mã nguồn.

10. /home : thư mục home 

- Thư mục lưu trữ tập tin cá nhân của tất cả user 

11. /boot : Boot loader file 

- Chứa các tập tin cấu hình cho quá trình khởi động hệ thống.

12. /lib : system Libraries 

- Chứa các file thư viện hỗ trợ các thư mục nằm dưới /bin và /sbin 
- Tên file thư viện có thể là ld* lib*.so.*.

13. /opt : optional add-on application 

- Chứa các thư mục add-on từ nhà cung cấp
- Ứng dùng add-on được cài ở thư mục /opt hoặc /opt/sub 

14. /mnt : mount directory

- Gắn kết các thư mục hệ thống tạm thời (thư mục temporary) nơi Systemadmin có thể gắn kết các file của hệ thống

15. /media : Removable media devices 

- Gắn kết các thư mực Temporary được hệ thống tạo ra khi một thiết bị lưu động được cắm vào hệ thống.

16. /srv : service data

- Chứa các servide của máy chủ cụ thể liên quan tới dữ liệu.



















