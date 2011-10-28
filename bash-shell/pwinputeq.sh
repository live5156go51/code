#! /bin/bash
# 测试输入是否相等使用test , 更多参数查看man test 
stty -echo
echo -n "输入密码: " # -n 密码输入
read input
stty echo
if test helloworld = $input
then
	echo -e "\n输入正确" # -e 换行
	exit
else
	echo -e "\n您输入的密码不正确"
	exit
fi
