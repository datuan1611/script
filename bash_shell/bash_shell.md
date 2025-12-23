# Lập trình SHELL trong Linux

> Author: TITV youtube  
> URL: [Tự học Linux cơ bản](https://www.youtube.com/playlist?list=PLyxSzL3F74878husgCe4IF6iJNSCjYTGq)

## Mục lục
- [Giới thiệu](#1-giới-thiệu)
- [Nhập / xuất dữ liệu](#2-nhập--xuất-dữ-liệu)
- [Thực hiện phép tính trong shell](#3-thực-hiện-phép-tính-trong-shell)
- [Truyền tham số lệnh trong Bash Shell](#4-truyền-tham-số-lệnh-trong-bash-shell)
- [Câu lệnh điều kiện và các phép so sánh](#5-câu-lệnh-điều-kiện-và-các-phép-so-sánh)


## 1. Giới thiệu

**Các loại shell**
- sh (Shell Bourne): shell nguyên thủy trên Unix/Linux
- bash (Bourne Again Shell): mở rộng của sh, được cài mặc định trên Linux
- csh,tcsh,zsh: shell sử dụng cấu trúc lệnh của C (phổ biết thứ 2 sau bash shell)

**Để thực thi 1 shell script 「run.sh」**
```bash
chmod a+x run.sh
./run.sh
```

**Cấu trúc**
```bash
#!/bin/bask						#chỉ định loại shell được sử dụng
echo "Hello World!"				#command
exit 0							#exit script
```
***※Lưu ý:***
- mỗi câu lệnh viết trên 1 dòng riêng, nếu có nhiều câu lệnh trên 1 dòng cần kết thúc bằng 「;」
- chú ý khi sử dụng các dấu nháy
	- nháy kém 「"」: những gì bên trong nháy kép được xem là ký tự riêng biệt
	- nháy đơn 「'」: những gì bên trong nháy đơn có ý nghĩa không đổi
	- nháy ngược 「`」: những gì bên trong nháy ngược là thực thi lệnh

**Biến trong shell**  
- biến shell dùng để lưu trữ dữ liệu chuỗi, số hoặc kết quả của 1 câu lệnh  
- để gán giá trị vào biến: ***var_name=var_value***  
	để sử dụng giá trị biến: ***$var_name***  
- có 2 loại biến:
	- biến hệ thống: được viết hoa các ký tự
	- biến người dùng đặt


## 2. Nhập / xuất dữ liệu

**Lệnh ECHO**
1. In chuỗi đơn giản trong dấu 「""」
```bash
echo "Hello, world!"
```
2. In giá trị của biến
```bash
name="Alice"
echo "Hello, $name!"
```
3. In chuỗi có dấu 「"」 bằng cách thêm 「\」 ngay phía trước
```bash
echo "Alice said \"Hello\""
```
4. Chèn biểu thức bên trong echo
```bash
echo "Today is $(date)"
```

**Lệnh READ**  
được dùng để đọc dữ liệu từ bàn phím và lưu vào các biến
> read [options] [variable...]

```bash
echo "Input your name:"
read name
echo "Hello, $name!"
```

1. -p,--prompt: cho phép chỉ định 1 câu thông báo để hướng dẫn user nhập dữ liệu
```bash
read -p "Input your name:" name
```
2. -s,--silent: cho phép nhập mật khẩu không hiển thị ký tự trên màn hình
```bash
read -s -p "Input your password:" password
```
3. -r,--raw: đọc dữ liệu mà ko thực hiện xử lý escape sequences (như 「\」 và 「$」)
```bash
read -r line
```
4.-a,--array: đọc dữ liệu và lưu vào 1 mảng
```bash
read -a names
```
***※Lưu ý:***  
có thể sử dụng nhiều options cùng lúc
```bash
read -rsp "Input your password:" password
```


## 3. Thực hiện phép tính trong shell

**Sử dụng EXPR**  
expr là tiện ích dòng lệnh, được dùng để thực hiện các phép toán số học và các phép toán chuỗi  
yêu cầu các toán hạng và toán tử ngăn cách bởi dấu cách
> expr [expression]
```bash
expr 5 + 2
expr 20 % 3
echo `expr 4 \* 2`
result=$(expr $a + $b)
```

**Sử dụng LET**  
let là 1 lệnh dành riêng cho shell script để thực hiện các phép tính số học
> let var = [expression]
```bash
let "m=$m+3"
let "n += 3"
let "z=$m*$n"
let result=$a+$b
```

**Sử dụng $((...))**  
\$((...)) là cú pháp trong bash shell để thực hiện các phép tính số học
> \$([expression]) OR \$(([expression]))
```bash
z=$(($z+3))
z=$(($m*$n))
result=$(($a+$b))
```

***Lưu ý:***  
để tính toán số thực trong bash shell, cần sử dụng math libriry 「bc -l」  
URL: https://www.gnu.org/software/bc/manual/html_mono/bc.html
```bash
echo "scale=3; 3.5 + 2.25"	| bc -l		#5.7500
echo "scale=4; 10 / 3"		| bc -l		#3.3333
echo "scale=6; sqrt(2)"		| bc -l		#1.414213
echo "scale=6; 5^3"		| bc -l		#125
echo "scale=10; 4*a(1)"		| bc -l		#3.1415926535
echo "scale=6; s(0.5)"		| bc -l		#sin(0.5 rad)

export LC_NUMERIC=C				#using 「.」 for floating-point number

read -p "Input radius of circle: " r
pi=$(echo "scale=10; 4*a(1)"	| bc -l)
S=$(echo "scale=6; $pi*$r*$r"	| bc -l)
printf "Area (S): %.2f\n" "$S"
```


## 4. Truyền tham số lệnh trong Bash Shell

- tham số lệnh: là tham số được truyền khi thực hiện script
- \$1, \$2, \$3... là tham số thứ 1, thứ 2, thứ 3... trên dòng lệnh (từ trái → phải)
- \$@ hoặc \$*: danh sách tất cả các tham số trên dòng lệnh

***Ví dụ:***
>./04_param_cmd.sh 10 20 30

```bash
#!/bin/bash

#Display 1st param of script
echo "1st param of script: $1"				#10

#Display 2nd param of script
echo "2nd param of script: $2"				#20

#Display 3rd param of script
echo "3rd param of script: $3"				#30

#Display all param of script
echo "all param of script: $@"				#10 20 30

#Calculate sum of param
echo "Sum of all param is: $(expr $1 + $2 + $3)"	#60

exit 0
```


## 5. Câu lệnh điều kiện và các phép so sánh

**Các toán tử so sánh số học**  
> -eq : bằng nhau (equal)  
> -ne : không bằng nhau (not equal)  
> -lt : nhỏ hơn (less than)  
> -gt : lớn hơn (greater than)  
> -le : nhỏ hơn hoặc bằng (less or equal)  
> -ge : lớn hơn hoặc bằng (greater or equal)  


---

```text
① ② ③ ④ ⑤ ⑥ ⑦ ⑧ ⑨ ⑩
１、 ２、 ３、 ４、 ５、 ６、 ７、 ８、 ９、 １０、
　〇 ■ □ △ ▲ ▽ ▼ ◆ ☆ ★ ・ • ● ＊ ※ （） 「」 『』 【】 ＜＞ ～ ？
　├ └ │ ┗ ⇒ → ← ↑ ↓ ➡ ／ ＋ － ✕ ： ＝ × ÷ ±  ＄ ✓
```