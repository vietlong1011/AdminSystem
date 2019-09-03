### A. Các bước thực hiện 
- Cài đặt apache
- Cài đặt mysql
- Cài đặt php 7.2
- Cài đặt wordpress
- Tạo DB và user theo wordpress

### B. Code
```
#!/bin/bash
# 1. Cài đặt apache
echo " cài đặt apache"
yum install -y httpd
systemctl restart httpd
systemctl enable httpd
# 2 . Cài dặt mysql
yum update
yum install wget
# tải và cài mysql repo
wget http://dev.mysql.com/get/mysql57-community-release-el7-9.noarch.rpm
rpm -ivh mysql5-community-release-el7-9.noarch.rpm
# cài mysql-server
yum install mysql-server
systemctl restart mysqld
systemctl enable mysqld
# 2.1 Tạo tài khoản root trong mysql
mysql_secure_installation
# 3 cài đặt php 7.2
echo " cài dặt PHP"
yum install epel-release yum-utils -y
yum install http://rpms.remirepo.net/enterprise/remi-release-7.rpm
yum-config-manager --enable remi-php72
yum install php php-common php-opcache php-mcrypt php-cli php-gd php-curl php-mysql -y
# 4 cài đặt wordpress
echo " cài đặt wordpress"
cd /var/www/html
wget https://wordpress.org/latest.tar.gz
tả xzvf latest.tar.gz
mv wordpress/* /var/www/html/
mv wp-config-sample.php wp-config.php
chown -R apache:apache /var/www/html/*
# 5. cấu hình wordpress
cd /var/www/html
vi wp-config.php
echo " nhap ten db"
read name_db
echo " nhap ten user "
read user
echo "nhap password "
read password
# 6. Tạo db cho wordpress
mysql -u root -p -e "create database $name_db ;
create user '$name_user'@'localhost' identified by '$password';
grant all privileges on $name_db.* to '$name_user'@'localhost';
flush privileges ;
exit "
systemctl restart mysqld 
systemctl restart httpd
```