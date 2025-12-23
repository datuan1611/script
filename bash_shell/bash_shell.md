**Lập trình SHELL trong Linux**

> Author: TITV youtuber
> URL: [Tự học Linux cơ bản](https://www.youtube.com/playlist?list=PLyxSzL3F74878husgCe4IF6iJNSCjYTGq)

# 1.Giới thiệu

## Các loại shell
- sh (Shell Bourne): shell nguyên thủy trên Unix/Linux
- bash (Bourne Again Shell): mở rộng của sh, được cài mặc định trên Linux
- csh,tcsh,zsh: shell sử dụng cấu trúc lệnh của C (phổ biết thứ 2 sau bash shell)

## Để thực thi 1 shell script 「run.sh」
```bash
chmod a+x run.sh
./run.sh
```

## Cấu trúc
```bash
#!/bin/bask						#chỉ định loại shell được sử dụng
echo "Hello World!"				#command
exit 0							#exit script
```
*※Lưu ý:*
- mỗi câu lệnh viết trên 1 dòng riêng, nếu có nhiều câu lệnh trên 1 dòng cần kết thúc bằng 「;」
- chú ý khi sử dụng các dấu nháy
	- nháy kém 「"」: những gì bên trong nháy kép được xem là ký tự riêng biệt
	- nháy đơn 「'」: những gì bên trong nháy đơn có ý nghĩa không đổi
	- nháy ngược 「`」: những gì bên trong nháy ngược là thực thi lệnh

## Biến trong shell
> biến: dùng để lưu trữ dữ liệu chuỗi, số hoặc kết quả của 1 câu lệnh
> để gán giá trịvào biến: ***var_name=var_value***
> để sử dụng giá trị biến: ***$var_name***
> có 2 loại:
> - biến hệ thống: được viết hoa các ký tự
> - biến người dùng đặt

# 2.Nhập/Xuất dữ liệu

## Lệnh ECHO
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

## Lệnh READ
> được dùng để đọc dữ liệu từ bàn phím và lưu vào các biến
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
※có thể sử dụng nhiều options cùng lúc
```bash
read -rsp "Input your password:" password
```

# 3.Thực hiện phép tính trong shell

## Sử dụng EXPR
> expr là tiện ích dòng lệnh, được dùng để thực hiện các phép toán số học và các phép toán chuỗi
> CÓ yêu cầu các toán hạng và toán tử ngăn cách bởi dấu cách
```bash
#expr [expression]
#----------------#
expr 5 + 2
expr 20 % 3
echo `expr 4 \* 2`
result=$(expr $a + $b)
```

## Sử dụng LET
> let là 1 lệnh dành riêng cho shell script để thực hiện các phép tính số học
```bash
#let var = [expression]
#----------------#
let "m=$m+3"
let "n += 3"
let "z=$m*$n"
let result=$a+$b
```

## Sử dụng $((...))
> $((...)) là cú pháp trong bash shell để thực hiện các phép tính số học
```bash
#$([expression]) OR $(([expression]))
#----------------#
z=$((z+3))
z=$(($m*$n))
result=$(($a+$b))
```

*Lưu ý:*
> để tính toán số thực trong bash shell, cần sử dụng math libriry 「bc -l」
> reference: https://www.gnu.org/software/bc/manual/html_mono/bc.html
```bash
echo "scale=3; 3.5 + 2.25"	| bc -l		#5.7500
echo "scale=4; 10 / 3"		| bc -l		#3.3333
echo "scale=6; sqrt(2)"		| bc -l		#1.414213
echo "scale=6; 5^3"			| bc -l		#125
echo "scale=10; 4*a(1)"		| bc -l		#3.1415926535
echo "scale=6; s(0.5)"		| bc -l		#sin(0.5 rad)

export LC_NUMERIC=C						#using 「.」 for floating-point number

read -p "Input radius of circle: " r
pi=$(echo "scale=10; 4*a(1)"		| bc -l)
S=$(echo "scale=6; $pi*$r*$r"		| bc -l)
printf "Area (S): %.2f\n" "$S"
```


```
①	②	③	④	⑤	⑥	⑦	⑧	⑨	⑩
１、	２、	３、	４、	５、	６、	７、	８、	９、	１０、
　 〇 ■ □ △ ▲ ▽ ▼ ◆ ☆ ★ 	・ • ● ＊ ※ （） 「」 『』 【】 ＜＞ ～？ ├ └ │ ┗ ⇒ → ← ↑ ↓ ➡	／ 〇 ＋ － ✕ ： ＝ × ÷ ±  ＄ ✓
```