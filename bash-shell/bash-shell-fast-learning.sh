#! /bin/bash
# website: http://www.justlinux.com/nhf/Programming/Introduction_to_bash_Shell_Scripting.html

# #! /bin/bash # 设置shell类型
# emacs 快捷键 C-c :

# YOUR FIRST BASH PROGRAM　第一个程序
echo "Hello World"

# A MORE USEFUL PROGRAM　一个有用的程序
mkdir trash
mv /tmp/*.log trash
rm -rf trash
echo "Deleted all files!"

# COMMENTS　注释
# emacs 快捷键 M-;
# this program counts from 1 to 10:
for i in 1 2 3 4 5 6 7 8 9 10; do
    echo 程序第$i次循环执行,然后把$i赋给i    
    sleep 1
done

# VARIABLES 变量
x=12
echo "定义变量x的值是: $x"
echo "我们要Hold住"

# CONTROL STRUCTURES 控制结构
cp /etc/passwd /tmp/
echo "Copy /etc/paddwd to /tmp Done."

# if ... else ... elif ... fi　　if 选择结构
# emacs 快捷键　C-c TAB
if [ -f /etc/passwd ]; then  
#等价于　　　更多test条件规则请 man test 查看
# if test -f /etc/passwd 
# then
    cp /etc/passwd /tmp/
    echo "/etc/passwd file exists Copy it to /tmp Done."
    exit
else
    echo "/etc/passwd file does not exist."
    exit
fi
#if [ "$x" -eq 5 ]; then    	# 使用变量测试

# while ... do ... done    while循环
# emacs 快捷键　C-c C-w
# 死循环
while [ true ]; do
    echo "Press CTRL-C to quit."
done
# 死循环另一写法
while :; do
    echo "Press CTRL-C to quit."
done

# 整数条件循环
x=0;
while [ $x -le 10 ]; do
    echo "Current value of x: $x"
    x=$(expr $x + 1)
    sleep 1
done

echo "hello world"

# Checks equality between numbers:    #检查数值相等
# x -eq y   Check is x is equals to y
# x -ne y   Check if x is not equals to y
# x -gt y   Check ifx is greater than y
# x -lt y   Check if x is less than y

# Checks equality between strings:　　　#检查字符相等
# x = y   Check if x is the same as y
# x != y   Check if x is not the same as y
# -n x   Evaluates to true if x is not null
# -z x   Evaluates to true if x is null.

me=$(whoami)
echo "I am $me."

echo "I am $(whoami)."

# until ... do ... done  与while有点相反的循环
# emacs 快捷键　C-c C-u
x=0
until [ "$x" -ge 10 ]; do
    echo "Current value of x: $x"
    x=$(expr $x + 1)
    sleep 1
done

# for ... in ... do ... done
# emacs 快捷键　C-c C-f
echo  "Checking system for errors"
for dots in 1 2 3 4 5 6 7 8 9 10; do
    echo -n "."
    echo "System clean."
done

for x in paper pencil pen; do
    echo "The value of variable x is :$x"
    sleep 1
done

# Copy adds a .html extension to all files in the current directory:
for file in *; do
    echo "Adding .html extension to $file..."
    cp $file /tmp/$file.html
    sleep 1
done

# case ... in ... done
# emacs 快捷键　C-c C-c
x=9
case $x in
    0)
	echo "Value of x is 0."
	;;
    5)
	echo "Value of x is 5."
	;;
    9)
	echo "Value of x is 9."
	;;
    *)
	echo "Unrecognized vlaue."	
esac

x=9
if [ "$x" -eq 0 ]; then
    echo "Value of x is 0."    
elif [ "$x" -eq 5 ]; then
    echo "Value of x is 5."    
elif [ "$x" -eq 9 ]; then
    echo "Value of x is 9."    
else
    echo "Unrecognized vlaue."	    
fi

# QUOTATIONS
mkdir hello world
mkdir "hello world"

x=5
echo "Using double quotes. the value of x is: $x"
echo 'Using forward quotes, the value of x is :$x'

x=`expr $x+1`
x=$(expr $x+1)

echo "I am `whoami`"

# ARITHMETIC WITH BASH
x=8
y=4
z=$(($x+$y))
echo "The sum of $x + $y is $z"
# ACTION             OPERATOR
# Addition              +
# Subtraction           -
# Multiplication        *
# Division              /
# Modulus               %
x=5
y=3
# add=$(expr $x+$y)
add=$(($x+$y))
sub=$(($x-$y))
mul=$(($x*$y))
dib=$(($x/$y))
mod=$(($x%$y))
echo "Sum: $add"
echo "Difference: $sub"
echo "Product: $mul"
echo "Quotient: $div"
echo "Remainder: $mod"

# READING USER INPUT
echo -n "Enter your name:"
read usern
echo "Hello $usern"

echo -n "Enter your name: "
read user_name

if [ -z "$user_name" ]; then
    echo "You did not tell me your name!"
    exit
else
    echo "Hello $user_name!"
fi

# FUNCTIONS 自定函数
# emacs 快捷键　C-c　C-(
function hello() {
    echo "You are in  function hello()"
}
echo "Calling function hello() ..."
hello
echo "You are now out of function hello()"

function new_user() {
    echo "Preparing to add a new user ..."
    sleep 2
    adduer
}
echo "1. Add uer"
echo "2. Exit"
echo "Enter your choice: "
read choice
case $choice in
    1) adduser
	;;
    *) exit
	;;
esac

# TRAPPING
# using the trap command
# trap CTRL-C and execute the sorry() function:
trap sorry INT
function sorry() {
    echo "I'm sorry Dave. I can't do that."
    sleep 3
}
for i in 10 9 8 7 6 5 4 3 2 1; do
    echo "$i Seconds until system failure."
    sleep 1
done
echo "System failure."

# execute the sorry() function if SIGINT is caught:
trap sorry INT
# reset the trap:
trap - INT
# do nothing when SIGINT is caught:
trap '' INT

# AND & OR 逻辑控制
x=5
y=10
#if [ "$x" -eq 5 ] && [ "$y" -eq 10 ]; then  #if 语句条件表达式注意空格严格
if [ "$x" -eq 3 ] || [ "$y" -eq 1 ]; then
    echo "Both conditions are true."
else
    echo "The conditions are not true."
fi

# USING ARGUMENTS 使用参数
# 特殊变量参数个数　$#
if [ "$#" -ne 1 ]; then
    echo "Usage: $0"
    echo "The argument is not equal 1."
else
    exit
fi
echo "The argument is $1"

# TEMPORARY FILES 临时文件
touch hello
touch hello.$$

# RETURN VALUES 返回值
grep "foobar" > /dev/null 2>&1
if [ "$?" -eq 0 ]; then
    echo "Match found."
    exit
else
    echo "No match found."
fi

if [ -f "/etc/passwd" ]; then
    echo "Password file exitsts."
    exit 0
else
    echo "No such file."
    exit 1
fi

# 函数用 return 返回值
function check_passwd() {
    if [ -f "/etc/passwd" ]; then
	echo "Password file exists."
	return 0
    else
	echo "No such file."
	return 1
    fi
}

foo=check_passwd
if [ "$foo" -eq 0 ]; then
    echo "File exists."
    exit 0
else
    echo "No such file."
    exit 1
fi