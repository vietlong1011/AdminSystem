### 1. Cài đặt java version 1.8.0_45 ( 8u45 )
- Tải gói cài đặt java 
	```
  jdk-8u45-linux-x64.rpm
	```
  
- Thực hiện cài đặt gói 
	```
  rpm -ivh jdk-8u45-linux-x64.rpm
	```
  
- Check version java 
	```
  java -version 
  ```
  
### 2. Cài đặt java version 1.8.0_251 ( 8u251 )
- Tải gói cài đặt java 
	```
  jdk-8u251-linux-x64.rpm
	```
  
- Thực hiện cài đặt gói 
	```
  rpm -ivh jdk-8u251-linux-x64.rpm
	```
  
	- Check version java 
	```
  java -version 
	```
	
### 3. Switch version java 
- Sử dụng lệnh ` alternatives --config java ` và  ` alternatives --config javac `
- Chọn number ,  trong đó number là dòng chứa version mà ta cần switch 
- Kiểm tra lại version java
