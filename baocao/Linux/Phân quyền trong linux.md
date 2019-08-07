### 1.Cấu trúc tập tin và thư mục 

> Dùng lệnh ` ls -al ` để xem cấu trúc toàn bộ tập tin hoặc thư mục 

![](img/cau-truc-file.png)

- ý nghĩa của từng chỉ số lần lượt từ trái sang là :
	- Loại file (d có nghĩa là thư mục 
	- Các chỉ số phân quyền (3 chỉ số liên tiếp sau file)
	- Hard link thể hiện nhiều file hoặc thư mục có cùng sử dụng chung inode 
	- Tên user sở hữu
	- Tên group sở hữu 
	- Dung lượng của file hoặc folder
	- Ngày tháng tạo ra file 
### 2.Phân quyền cho tập tin và thư mục 

1. Linux có 3 quyền cơ bản của một user và group đó là 
- 4 hoặc r (read) : quyền đọc file hoặc folder 
- 2 hoặc w (write) : ghi sửa nội dung file hoặc folder 
- 1 hoặc x (exucute) : quyền truy cập thư mục và thực thi run thư mục 
- 0 hoặc - : không có quyền 

2. Mỗi một chỉ thị phân quyền gồm 3 kí tự và lần lượt ý nghĩa các nhóm 3 kí tự đó là 

- owner : quyền của user chủ sở hữu file 
- group : quyền của user thuộc group có user chủ sở hữu file nằm trong
- other : quyền của tất cả các user khác trên máy 

3. Thay đổi chỉ số để phân quyền 
- ` chmod -v số_chỉ_phân_quyền tên_file ` : Hiển thị báo cáo ngay khi chạy lệnh , mỗi lần đổi quyền sẽ hiển thị .
- ` chmod -c số_chỉ_phân_quyền tên_file ` : Hiển thị giống `-v` khi đã thực thi lệnh xong 
- ` chmod -R số_chỉ_phân_quyền tên_file ` : Áp dụng cho file và các folder con.

4. Thay đổi chủ sở hữu cho file hoặc thư mục 
- `chown (-v,-c,-R) tên_user_sở_hữu_mới:tên_group_sở_hữu_mới tên_file ` 










