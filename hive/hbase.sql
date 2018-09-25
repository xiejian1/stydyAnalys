#hbase是面向列存储的数据库，Hbase中数据列是由列簇来组织的，一个列簇相当于你在mysql中这个表的多个列定义的总和。
#在同一个列簇中的列是存放在一个实例上的。所以对于列簇的理解我的猜测是这样的，刚开始可能没有列簇。
#虽然nosql是不用定义列的，但是由于我们的hadoop是分布式的，肯定会有一些列在这台机子上，有一些列在那些机子上，为了性能问题，
#需要弄出一个算法来把一些经常在一起使用的列放到一台机子上，最简单的算法就是由用户自己去定，这就产生了列簇，也就是列的集合
#，在同一个列簇中的列都在一个机子上。
https://blog.csdn.net/mnasd/article/details/79574768

#hbase数据簇相当于mysql数据库列的总和
#和mysql数据库中的字段一样

#1.创建一个表
create 'student','info'  #info 代表列簇
#

#2.增加数据
put 'student','row1','info:name','jack'

#3.rowkey Rowkey是一段字节数组，这意味着，任何东西都可以保存进去，
#例如字符串、或者数字。行是按字典的排序由低到高存储在表中
put 'student','row1','info:sid','1'
put 'student','row1','info:age','22'


#4.查询表的数据
scan 'student'
#可以看到有三条记录，但是都是一个row里面的，这个row才是相当于mysql的一行
#继续插入别的记录，最终结果是这样

#5.limitc查询后显示的条数
scan 'student',{'limit'=>2}

#6.startrow起点rowkey
#用startrow可以定义查询返回结果的起点rowkey，相当于大于等于，比如
scan 'student',{'startrow'=>'row2'}
#使用通配符
scan 'student',{'startrow'=>row*}
#多个参数同时使用
scan 'student',{'startrow'=>row2,'limit'=>1}
#stoprow定义查询的结束rowkey，同startrow

#7.columns控制返回的字段列表
#就相当于sql中的 select xx,xxx,xxx  from 这里面的列定义。比如我只需要查询所有学生的名字和年龄，不需要sid信息
scan 'student',{'columns'=>['info:name','info:age'],'limit'=>3}

#8.使用timestamp来精确定位数据
scan 'student',{'timestamp'=>1420817315351}

#9.获取一行数据
get 'student','row1'
#更上复杂额参数
get 'student','row1',{'column'=>['info:name','info:age'],'timestamp'=>1420817315351}

#10.查看标的信息
describe 'student'

#11.修改表的列簇
#用alter可以修改表的列簇，hbase的一个表其实全部信息就是列簇的信息了，比如我们可以增加一个列簇f2
alter 'student',{NAME=> 'f2',version=>2}

#12.ttl控制表的自动过期
alter 'student',{NAME=>'f2',TTL=>20}

#13.使用alter删除列簇
alter 'student',{NAME=>'f2',METHOD=>'delete'}

#14.统计表中的数据
count 'student'

#15.查看数据库中所有的表
list

#16.查看服务的状态
status

#17.查看链接用户
whoami

#18.快速清除数据
truncate 'student'