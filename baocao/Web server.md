### A.WEB SERVER là gì?

> Web server ( máy chủ web) là máy chủ mà trên đó cài đặt phần mềm chạy Website. 

- Các Wed server đều hiểu và đọc được các file *.htm và *.html tuy nhiên mỗi web server lại phục vụ một số kiểu file chuyên biệt như:
	- IIS của Microsoft dành cho *.asp và *.aspx ...
	- Apache dành cho *.php...
	- Sun Fava System Web Server của Sun dành cho *p 

- Máy chủ Webserver là máy chủ có dung lượng lưu trữ lớn, tốc độ xử lý nhanh . Máy chủ Webserver được dùng như là một nơi lưu trữ thông tin của các website và các dữ liệu liên quan.

### B. WEB SERVER dùng để làm gì?

> Người dùng có thể truy cập vào các website thông qua internet và giao thức HTTP khi các website này được lưu trữ trong Webserver với một địa chỉ IP duy nhất hoặc Domain name duy nhất. Bất cứ máy tính, máy chủ nào cũng có thể trở thành web server khi được cài đặt chương trình phần mềm server software và connect vào internet .

### C. Hoạt động của Webserver.

#### 1. Hoạt động của Webserver.

> Khi người dùng muốn truy cập vào một website thì họ phải có kết nối internet và sử dụng giao thử HTTP trên các trình duyệt web.

- Người dùng truy cập website bằng địa chỉ IP, lúc này yêu cầu sẽ gửi trực tiếp tới Webserver có chứa Ip trên. 
	- Nếu người dung truy cập website bằng tên miền, yêu cầu sẽ gửi tới DNS server để phân giải tên miền trên thành địa chỉ IP và gửi yêu 		cầu truy cập website tới webserver có chứa IP vừa phân giải được .
- Trên một máy chủ có thể có nhiều website cùng được lưu trữ. Máy chủ sẽ truy cập tới đúng website theo IP và trả kết quả là file gồm các thẻ HTML về máy của người dùng.



#### 2. Dịch vụ Web.

> Dịch vụ wed(ws: web service) : là một phương thức tích hợp các ứng dụng trên nền web.Mỗi một chức năng của ứng dụng có thể được sử dụng và kết hợp khác nhau để tạo thành một dịch vụ wed.

> Dòng tiến trình của một dịch vụ website như sau:

1. Phát hiện:
	Tìm kiếm các dịch vụ web thích hợp trên một website UDDI.
2. Mô tả:
	Website UDDI trả lời bằng một tệp WSDL mô tả về dịch vụ website thích hợp cho ứng dụng Client.
3. Tạo Proxy:
	Tạo một Proxy cục bộ cho dịch vụ từ xa .
4. Tạo thông báo SOAP:
	Tạo ra một thông báo SOAP/XML và gửi đến địa chỉ URL được xác định trong tệp WSDL
5. Nhận cuộc gọi và diễn dịch: 
	SOAP listener là chương trình chạy trên máy chủ để nhận cuộc gọi và diễn dịch nó cho các dịch vụ web.
6. Thực hiện: 
	Dịch vụ Web thực hiện trước năng của mình và trả về kết quả cho client thông qua listener và proxy.
``` 	UDDI : chuẩn quy định về loại website đặc biệt chuyên cung cấp vị trí của các dịch vụ website có trên mạng.
	WSDL : ngôn ngữ chuẩn cho phép mô tả đúng tính năng của các dịch vụ web.
	SOAP : giao thức chuẩn trao đổi thông tin giữa các dịch vụ web.
	XML  : ngôn ngữ đánh dấu siêu văn bản 
```


### D.Cấu trúc Webserver.

#### 1. Cấu trúc:

> Web server có thể là phần cứng , có thể là phần mềm hoặc là sự kết hợp giữa phần cứng và phần mềm.

1. Phần cứng.
- Một webserver là một máy tính lưu trữ các file thành phần của một website và có thể phân phát các file này tới người dùng đầu cuối. Máy tính này có kết nối internet và có thể thể được truy cập được thông qua địa chỉ IP hoặc tên miền cụ thể.

2. Phần mềm.
- Một webserver bao gồm một số phần dùng để điều khiển người dùng truy cập website truy cập vào các file được lưu trữ trên HTTP server.

#### 2. Phân biệt web tĩnh và web động trong máy chủ web.

1. web tĩnh ( web static).
- web tĩnh được hiểu đơn giản là các website được dùng với mục đích chính là hiển thị nội dung cố định được gửi trực tiếp từ webserver về một cách nguyên vẹn.
2. web động (web dynamic) 
- web động là website có cơ sở dữ liệu và liên kết với các ứng dụng, phần mềm phát triển web khác.







 
