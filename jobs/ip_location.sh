#!/bin/bash
# 作者：日行一善 <qq：1969679546> <email：1969679546@qq.com>
# 官网：www.linkops.cn
#
# 日期：2017/10/20
# 介绍：根据IP地址查询所在地
#
# 适用：centos6+
# 语言：中文
#
# 注意：需要联网


ipp (){
exec < $1
while read a
do
        sring=`curl -s "http://ip138.com/ips138.asp?ip=${a}&action=2"| iconv -f gb2312 -t utf-8|grep '<ul class="ul1"><li>' |awk -F '<' '{print $4}' | awk -F'：' '{print $2}'`
        echo $a $sring
done
}


cha() {
srin=`curl -s "http://ip138.com/ips138.asp?ip=${1}&action=2"| iconv -f gb2312 -t utf-8|grep '<ul class="ul1"><li>' |awk -F '<' '{print $4}' | awk -F'：' '{print $2}'`
echo $1 $srin
}


firewal() {
for i in `lastb|awk '{print $3}' | sort | uniq |egrep -o '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}'`
do
        sri=`curl -s "http://ip138.com/ips138.asp?ip=${i}&action=2"| iconv -f gb2312 -t utf-8|grep '<ul class="ul1"><li>' |awk -F '<' '{print $4}' | awk -F'：' '{print $2}'`
        echo $i $sri
done
}


if [ "$1" == "-f" ];then
        ipp $2
elif [ "$1" == "-i" ];then
        cha $2
elif [ "$1" == "-q" ];then
        firewal
else
        echo "-f + 文件   批量显示ip所在地"
        echo "-i + ip地址 显示ip所在地"
        echo "-q          显示尝试登陆此服务器的ip所在地"
fi
