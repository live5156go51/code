#! /bin/bash
LOGO="Sample Menu Demo"
amenu="a. 系统信息"
bmenu="b. 显示PCI设备"
cmenu="c. 查看文件或文件目录大小"
dmenu="d. 突破GFW,一键翻墙"
emenu="?. 帮助 "
function badchoice() {
    MSG="操作无效,请按提示操作..."
}
function help() {
    clear
    echo `date`
    echo
    cat <<EOF
        Shell 脚本菜单 Demo
    1.按照提示选择相应操作不区分大小写
    2.无论何时?显示帮助信息
    3.按 m/M 返回主菜单
                          by Junstrix
                   junstrix@gmail.com
EOF
    echo -e "\v"
    echo -n "?(help), m/M(menu),x/X(quit) -> ENTER: "
    read answer
    case $answer in
	\?)
	    help
	    ;;
	m|M)
	    themenu
	    ;;
	x|X)
	    exit 0
	    ;;
	*)
	    help
    esac
}
function apick() {
    clear
    echo `date`
    echo -e "\v"
    echo -e "\t主机名称\t `uname -n`"
    echo -e "\t内核发行号\t `uname -r`"
    echo -e "\t硬件架构名称\t `uname -m`"
    echo -e "\t操作系统名称\t `uname -o`"
    echo -e "\v"
    echo -n "?(help), m/M(menu),x/X(quit) -> ENTER: "    
    read answer
    case $answer in
	\?)
	    help
	    ;;
	m|M)
	    themenu
	    ;;
	x|X)
	    exit 0
	    ;;
	*)
	    apick
    esac
}
function bpick() {
    lspci -m | more
    echo -e "\v"
    echo -n "?(help), m/M(menu),x/X(quit) -> ENTER: "    
    read answer
    case $answer in
	\?)
	    help
	    ;;
	m|M)
	    themenu
	    ;;
	x|X)
	    exit 0
	    ;;
	*)
	    bpick
    esac
}
function cpick() {
    clear
    echo `date`
    echo -e "\v"
    echo 
    cat <<EOF
　　输入文件或目录路径，支持通配符
　　如查看用户目录情况,键入:/home/user/*
EOF
    echo -e "\v"
    echo -ne "\t输入路径: "
    read input
    du -sPh $input | more
    echo -e "\v"
    echo -n "?(help), m/M(menu),x/X(quit) -> ENTER: "    
    read answer
    case $answer in
	\?)
	    help
	    ;;
	m|M)
	    themenu
	    ;;
	x|X)
	    exit 0
	    ;;
	*)
	    cpick
    esac
}
function dpick() {
    while [ true ]; do
	clear
	echo `date`
	echo -e "\v"
	echo "comming soon.."
    echo -e "\v"
    echo -n "?(help), m/M(menu),x/X(quit) -> ENTER: "    
    read answer
    case $answer in
	\?)
	    help
	    ;;
	m|M)
	    break
	    themenu
	    ;;
	x|X)
	    exit 0
	    ;;
	*)
	    dpick
    esac
	
    done
}
function epick() {
    badchoice
}
function themenu() {
    clear
    echo `date`
    echo
    echo -e "\t\t\t$LOGO"
    echo 
#    echo -e "\tPlease Select:"
    echo -e "\t        请选择: "
    echo
    echo -e "\t\t\t$amenu"
    echo -e "\t\t\t$bmenu"
    echo -e "\t\t\t$cmenu"
    echo -e "\t\t\t$dmenu"
    echo -e "\t\t\t$emenu"
    echo -e "\t\t\tx. Exit"
    echo
    echo $MSG
    echo -e "\v"
#    echo "Select by presing the letter and then ENTER"
    echo -n "选择操作，输入: "
}

MSG=" "
while [ true ]; do
    themenu
    read answer
    MSG=" "
    # 4?
    case $answer in
	a|A)
	    apick
	    ;;
	b|B)
	    bpick
	    ;;
	c|C)
	    cpick
	    ;;
	d|D)
	    dpick
	    ;;
	e|E)
	    epick
	    ;;
	x|X)
	    break
	    ;;
	\?)
	    help
	    ;;
	m/M)
	    themenu
	    ;;
	*)
	    badchoice
	    ;;	    
    esac
done