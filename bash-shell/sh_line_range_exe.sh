#! /bin/bash
#　功能: 执行一个shell脚本指定行范围
#  使用:程序后跟三个参数
#  第一个参数为起始行，第二个参数为结束行，第三参数为源文件
#  EXAMPLE:./sh_line_range_exe.sh 11 22 ./bashhtml.sh
#  以上执行./bashhtml.sh 11到22行之间的脚本
function helpinfo() {
    cat <<EOF
USAGE:./sh_line_range_exe.sh [-h] start_line end_line src_file
OPTIONS: -h show help
EOF
exit 0
}

if [ "$1" = "-h" ] || [ -z "$1" ] || [ "$#" -le 2 ]; then
    helpinfo
    exit 1
else
    sed -n ""$1","$2"p" $3 | bash
fi
