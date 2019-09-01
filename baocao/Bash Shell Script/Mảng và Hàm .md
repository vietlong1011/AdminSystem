#### A. Mảng 
#### 1. Khai báo mảng 
- ` name_array=(1 2 3 4 5 6 7 )` 
hoặc
- ` name_array[0]="test" ` 
  ` name_array[1]="test2" `

#### 2. In nội dung của mảng 

- ` echo ${name_arayy[index]} 

##### 2.1 In tất cả nội dung của mảng

- `echo ${name_array[*]} `
hoặc
- `echo ${name_array[@]} `

##### 2.2 In chiều dài , số phần tử của mảng
- ` echo ${#name_mang[*]} `
hoặc
- ` echo ${#name_array[@]} `

### B.Hàm 
#### 1. Khai báo hàm 
``` 
name()
{
	Câu lệnh
}
```
hoặc
```
function name()
{
	các câu lệnh
}
```
#### 2. Gọi hàm
- `$ name ` : hàm không có đối số
- `$ name arg1 arg2 `:hàm có đối số 


