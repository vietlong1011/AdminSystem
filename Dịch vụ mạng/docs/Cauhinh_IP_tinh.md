### Cấu hình ip tĩnh trên CenOS 7.
- Câu lệnh truy cập cài đặt:
`cd /etc/sysconfig/network-scripts/ `
- Lấy tên các card mạng :
`ls`
- Dùng trình soạn thảo vi để chỉnh sửa:
	- Device : thiết bị 
	- BOOTPROTO : cấu hình ip tĩnh  để static còn cấu hình động thì để dhcp
	- ONBOOT : yes để khởi động cùng hệ thống 
	- IPADDR : đặt ip tĩnh 
	- NETMASK : subnet mask được sử dụng 
	- Gateway : địa chỉ cổng gateway
	- DNS : địa chỉ DNS server.
					
#### vd:
```
DEVICE=ens33
BOOTPROTO=static
ONBOOT=yes
IPADDR=192.168.73.3
NETMASK=255.255.255.0
GATEWAY=192.168.73.2
DNS1=8.8.8.8
DNS2=4.4.4.4
```

- Khởi động lại card mạng.
`systemctl restart network `
	
