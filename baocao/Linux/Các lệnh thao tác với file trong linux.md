### 1.Các lệnh điều hướng và thăm dò. 

1. Kiểm tra vị trí ta đang nằm trong hệ thống.
` pwd `

2. Xem trong thư mục đó gồm những file và thư mục con nào
``` 
ls
-a : xem cả các file bị ẩn
-l : xem thông tin bao gồm ACL ( access control list ), kích cỡ , ngày tháng cập nhật, chủ sở hưu..
-p : thêm slash để đánh dấu các thư mục 
-R : xem cả cây thư mục

```

3. Chuyển thư mục
` cd `

4. chuyển sang thư mục mẹ
` cd .. `

5. Chuyển về thư mục trước 
` cd - `

6. Lệnh grep 
- Lọc tên tập tin và thư mục muốn xem 
` ls | grep tên_muốn_tìm `
- Lọc chuỗi trong file 
` grep "chuỗi cần tìm" tên_file `

### 2.Các thao tác với file và thư mục 

1. Hiển thị toàn bộ nội dung file
` cat tên_file `

2. Tạo file mới
` touch tên_file `

3. Tạo thư mục mới
` mkdir tên_thư_mục `

4. Di chuyển file vào thư mục hoặc một thư mục vào thư mục khác
` mv tên_file đường_dẫn ` 

5. Đổi tên file hoặc tên thư mục và dùng -i để không bị ghi đè
` mv -i tên_file1 tên_file2 `

6. Sao chép file hoặc thư mục với tên khác
` cp tên_file1 tên_file2 `

7. Sao chép file này tới thư mục khác
` cp tên_file đường_dẫn `

8. Sao chép thư mục này sang thư mục khác
` cp -r tên_thư_mục đường_dẫn `

9. Xóa file hoặc thư mục 
- Xóa file
`rm tên_file`

- Xóa thư mục rỗng 
` rmdir tên_thư_mục `

- Xóa cả cây thư mục 
` rm -r tên thư mục `


### 3. Lệnh về thông tin hệ thống 

1. Kiểm tra dung lượng các phân vùng ( partition )
` df -h ` 

2. Kiểm tra các thông tin về Ram 
``` 
free -b : hiển thị dạng byte 
	-k -m -g : kilobyte megabyte gigabyte 
	-t hiển thị tổng cộng số Ram 
```

3. Task Manager của Linux 
` top` thoát `q` 

4. Thông tin về Kernel 
- ` uname -a ` : xem toàn bộ thông tin
- ` uname -v ` : xem version của OS
- ` uname -m ` : Hardware 
- ` uname -o ` : Hệ điều hành đang dùng 

### 4.Các phím tắt trong linux 

- Ctrl+c : dừng hoàn toàn lệnh đang chạy
- Ctrl+z : tạm dừng lệnh hiện tại, tiếp tục chạy nền bằng lệnh bg hoặc chạy chính với lệnh fg
- Ctrl+d : thoát khỏi phiên làm việc hiện tại, giống với exit
- Ctrl+w : xóa một từ trong dòng hiện tại
- Ctrl+u : xóa cả dòng
- Ctrl+r : hiện danh sách các lệnh gần đây
- !! : lặp lại lệnh gần đây nhất
- exit : thoát khỏi phiên làm việc hiện tại
















