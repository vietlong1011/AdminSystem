### Runlevel trong Linux 

> Linux hỗ trợ 7 runlevel được lưu trong file etc/inittab . Mỗi một runlevel sẽ tự động start một số chức năng, dịch vụ nhất định.

- Các runlevel trong linux
	- 0 : halt, đây là chế độ tắt máy
	- 1 : singer-user mode sử dụng trong backup/restores và repair 
	- 2 : multiuser không hỗ trợ network 
	- 3 : multiuser có hỗ trợ network 
	- 4 : không dùng 
	- 5 : x11 chạy linux với giao diện đồ họa 
	- 6 : reboot , chế độ khởi động lai máy 
- Để kiểm tra ta đang sư dụng hệ thống ở runlevel nào thì dùng lệnh:

` who -r ` hoặc `runlevl` 
