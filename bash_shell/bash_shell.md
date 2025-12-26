# Lập trình SHELL trong Linux

> Author: TITV youtube  
> URL: [Tự học Linux cơ bản](https://www.youtube.com/playlist?list=PLyxSzL3F74878husgCe4IF6iJNSCjYTGq)

## Mục lục
- [Giới thiệu](#1-giới-thiệu)
- [Nhập / xuất dữ liệu](#2-nhập--xuất-dữ-liệu)
- [Thực hiện phép tính trong shell](#3-thực-hiện-phép-tính-trong-shell)
- [Truyền tham số lệnh trong Bash Shell](#4-truyền-tham-số-lệnh-trong-bash-shell)
- [Câu lệnh điều kiện và các phép so sánh](#5-câu-lệnh-điều-kiện-và-các-phép-so-sánh)
- [Vòng lặp trong shell](#6-vòng-lặp-trong-shell)
- [Mảng dữ liệu](#7-mảng-dữ-liệu)
- [Function trong shell](#8-function-trong-shell)
- [Đọc ghi file và sắp xếp mảng](#9-đọc-ghi-file-và-sắp-xếp-mảng)

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
echo "scale=6; 5^3"			| bc -l		#125
echo "scale=10; 4*a(1)"		| bc -l		#3.1415926535
echo "scale=6; s(0.5)"		| bc -l		#sin(0.5 rad)

export LC_NUMERIC=C						#using 「.」 for floating-point number

read -p "Input radius of circle: " r
pi=$(echo "scale=10; 4*a(1)"	| bc -l)
S=$(echo "scale=6; $pi*$r*$r"	| bc -l)
printf "Area (S): %.2f\n" "$S"
```


## 4. Truyền tham số lệnh trong Bash Shell

- tham số lệnh: là tham số được truyền khi thực hiện script
- \$1, \$2, \$3... là tham số thứ 1, thứ 2, thứ 3... trên dòng lệnh (từ trái → phải)
- \$\@ hoặc \$\*: danh sách tất cả các tham số trên dòng lệnh

***Ví dụ:***
>./04_param_string.sh "Anh Tuan Do"
```bash
#Output param string by ECHO
echo "Hello, $1!"				#Hello, Anh Tuan Do!
```

>./04_param_sum.sh 10 20 30
```bash
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
```


## 5. Câu lệnh điều kiện và các phép so sánh

**Các toán tử so sánh số học**  
> -eq : bằng nhau (equal)  
> -ne : không bằng nhau (not equal)  
> -lt : nhỏ hơn (less than)  
> -gt : lớn hơn (greater than)  
> -le : nhỏ hơn hoặc bằng (less or equal)  
> -ge : lớn hơn hoặc bằng (greater or equal)  

**Sử dụng điều kiện IF**  
```bash
read -p "Input your age: " age

if [ $age -gt 18 ]; then
	echo "You are an adult."
elif [ $age -lt 13 ]; then
	echo "You are a child."
else
	echo "You are a teenager."
fi
```

## 6. Vòng lặp trong shell

**Vòng lặp WHILE**  
```bash
counter=1

while [ $counter -lt 5 ]; do
	echo "Loop WHILE: counter[$counter]"
	#counter=$(expr "$counter + 1")
	counter=$(($counter+1))
done
```
**Vòng lặp FOR**  
```bash
for index in {1..5}; do
	echo "Loop FOR: index[$index]"
done
```

>sử dụng FOR để duyệt các tham số lệnh 「\$@」  
>./06_loop_for_param.sh Alice John Tommy  
```bash
for param in "$@"; do
	echo "Loop FOR: param[$param]"
done
```

**Lệnh BREAK**  
```bash
counter=1

while [ $counter -lt 5 ]; do
	echo "Loop WHILE: counter[$counter]"
	if [ $counter -eq 3 ]; then
		break
	fi
	counter=$(($counter+1))
done
```


## 7. Mảng dữ liệu

> mảng: là cấu trúc dữ liệu linh hoạt, cho phép lưu trữ nhiều giá trị trong 1 biến  
> mảng trong shell có đặc điểm:  
> - không cần khai báo với kích thước cố định  
> - có thể chứa các loại dữ liệu khác nhau: chuỗi, số nguyên, số thực  

**Khai báo mảng**  
```bash
#Method 1: Define array by assigning directly
arr_strings=("apple" "banana" "cherry")
arr_numbers=(1 2 3 4 5)

#Method 2: Define array by result of command/available
arr_files=(*.txt)
```

**Truy cập vào phần tử của mảng**
```bash
#Access 1st member of array
echo ${arr_strings[0]}		#Output: apple

#Access 3rd member of array
echo ${arr_strings[2]}		#Output: cherry

#Access all members of array
echo ${arr_strings[@]}		#Output: apple banana cherry

#Count members of array
echo ${#arr_strings[@]}		#Output: 3
```

**Xóa phần tử của mảng**
```bash
#Delete 2nd member of array
unset arr_strings[1]

#Delete all of array
unset arr_strings
```

**Duyệt các phần tử của mảng**
```bash
#Loop through array by FOR
for element in "${arr_strings[@]}"; do
	echo "$element"
done

#Loop through array by WHILE
index=0

while [ $index -lt ${#arr_strings[@]} ]; do
	echo "${arr_strings[$index]}"
	index=$(($index+1))
done
```

***Lưu ý***  
>khi input 1 mảng bằng lệnh READ, thêm options 「-a」
```bash
read -p "Input array of numbers: " -a arr_number
```


## 8. Function trong shell

**Function**  
- hàm là 1 khối mã lệnh được tổ chức để thực hiện 1 tác vụ cụ thể
- hàm được dùng để tái sử dụng mã, tắng tính tổ chức và dễ duy trì của mã
- hàm có thể được gọi từ bất kỳ đâu trong chương trình, và thực hiện 1 loạt các lệnh được định nghĩa bên trong nó

***Lưu ý***  
>khi define 1 function, không khai bác các tham số trong 「()」  
>để truyền tham số vào trong function, nên sử dụng các tham số lệnh đối khi call function

```bash
#Define a function
print_message() {
	echo "Hello, $1!"
}

#Call a function
read -p "Input your name: " name
print_message $name
```


## 9. Đọc ghi file và sắp xếp mảng

```terminal
#echo "9 5 3 1 5 89 10" > 09_file_input.txt
#touch 09_file_output.txt
#./09_file_arrange_array.sh 09_file_input.txt 09_file_output.txt
file_input: 9 5 3 1 5 89 10
file_output: 1 3 5 5 9 10 89
```

```bash
#Check if file_input is existing or not
if [ ! -f "$file_input" ]; then
	echo "File $file_input is not existing"
	exit
fi

#Read array from file_input
read -r -a arr_number < "$file_input"

#Count member of array
n=${#arr_number[@]}

#Arrange member of array
for ((i = 0; i < n-1; i++)); do
	for ((j = i+1; j < n; j++)); do
		if [ ${arr_number[$i]} -gt ${arr_number[$j]} ]; then
			tmp=${arr_number[$i]}
			arr_number[$i]=${arr_number[$j]}
			arr_number[$j]=$tmp
		fi
	done
done

#Write result into file_output
echo "${arr_number[@]}" > "$file_output"
```


---

```text
① ② ③ ④ ⑤ ⑥ ⑦ ⑧ ⑨ ⑩
１、 ２、 ３、 ４、 ５、 ６、 ７、 ８、 ９、 １０、
　〇 ■ □ △ ▲ ▽ ▼ ◆ ☆ ★ ・ • ● ＊ ※ （） 「」 『』 【】 ＜＞ ～ ？
　├ └ │ ┗ ⇒ → ← ↑ ↓ ➡ ／ ＋ － ✕ ： ＝ × ÷ ±  ＄ ✓
```