
`文本操作篇`

`元字符`

    . 匹配除换行符外的任意单个字符
    * 匹配任意一个跟在它前面的字符
    [] 匹配方括号中的字符类中的任意一个
    ^ 匹配开头
    $ 匹配结尾
    \ 转义后面的特殊字符
    
    grep "string"
    grep pass....$ /root/..  任意四个字符，并结尾
    grep pas.*    任意字符
    grep [Hh]ello
    grep ^#  #开头
    grep "\." 

`扩展元字符`
    + 匹配前面的正则表达式至少出现一次
    ? 匹配前面的正则表达式出现零或一次
    | 匹配它前面或后面的正则表达式

    find passwd
    ls passw*
    find /etc/ -name passwd
    find /etc/ -name pass*
    find /etc/ -regex .*wd
    find /etc/ -regex .etc..*wd$
    find /etc -type f -regex .*wd

    -exec -ok 执行操作
    -v 显示进度
    find *.txt -exec rm -v {} \;

    grep pass $file | cut -d " " -f 
    cut -d ":" -f7 /etc/passwd/ | sort | uniq -c ｜ sort -r (反向排序)

太麻烦！！！！ 
文本编辑器 交互式    vim
行编辑器   非交互式  sed / awk

1. sed
   sed 模式空间，将文件以行为单位读取到内存（模式空间）
   sed 每个脚本 对该行进行操作
   sed 处理完输出
替换命令
sed 's/old/new/' filename
sed -e 's/old/new/' -e 's/old/new/' filename ...
sed -i 's/old/new/' 's/old/new/' filename
sed s'/正则表达式/new' filename
sed -r s'/扩展正则表达式/new' filename

2. awk
    sed 将不规则的文本，处理为比较规范的文本 
    awk 用于比较规范的文本处理，用于统计数量并输出指定字段

    BEGIN{}
    主输入循环{}
    END{}

    awk 默认使用 空格 制表符 分隔开的单词称作字段
    awk '{print $1, $2}' filename 
    awk -F ',' '{print $1, $2}' filename 
    分隔符可以用正则表达式

    head -5 /etc/passwd | awk 'BEGIN{RS=":"}{print $0}'
    awk '{print NR}'

3. cron  周期性计划任务

    crontab -e 
    crontab -l
    分钟 小时 日期 月份 星期 执行的命令


4. 








