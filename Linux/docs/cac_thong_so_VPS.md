### 1. Kiểm tra các thông số VPS
- Kiểm tra CPU
` cat /proc/cpuinfo`

- Lệnh theo dõi CPU
` top -c `

- Lệnh kiểm tra hệ điều hành
` uname -a`

- Lệnh kiểm tra phiên bản của hệ điều hành
` cat /etc/redhat-release` 

- Lệnh kiểm tra RAM
` free -m`

- Lệnh kiểm tra HDD
` df -h``

- Lệnh kiểm tra tốc độ đọc ghi HDD
` dd if=/dev/zero of=1GB.tmp bs=1024 count=1M conv=fdatasync `

- Lệnh kiểm tra cá user 
` cat /etc/passwd`



