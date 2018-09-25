#hadoop是项目的总称，主要由分布式存储HDFS,分布式运算mapReduce组成
#################################hive是一个SQL解析引擎，它将SQL语句转移成M/RJOB##################
######################然后在Hadoop中运行，与传统的数据库不同########################
#1.查看指定目录下内容
Hadoop dfs -ls [文件目录]

#2.打开某个已经存在的文件
hadoop dfs -cat [file_path]

#3.删除某个文件
hadoop fs -rm file

#4.将本地文件存储至hadoop
hadoop fs -put [本地文件]
#5.新建文件夹
hdfs fs -mkdir file
#6.删除文件夹
hdfs fs -rmr file

#hive基本操作

#1.建表
create [external] table 'xie'(
  id int,
  name varchar(20),
  age int(2),
)comment '表注释'
[partitioned by(id int)]  #分区表字段(文件非常大，采用分区可以快速过滤出按分区字段划分的数字)
[row format delimited]
[fields terminated by '/t'] #字段之间是按什么分隔开的
[stored as texefile]  #用哪种方式存储数据

#2.查看库
show databases;
#3.用某一个库
use databases;

#4.查看表
show tables;
#5.模糊查询
show tables '*TMP*';
#6.查看表有那些分区
show partitions table;
#7.使用某一个表
use table;
#8.查看表
desc tebles ;

#9删除表
drop table name;
#10.增加字段
alter table name add colums(class varchar(20))

#导入数据使用load命令
load data[local] impath 'filepath'[overwrite] into table name[partition]


#查询数据
#基于partition
#但是如果一个表使用partitioned by子句建表，查询就可以利用分区剪枝（input pruning）的特性，只扫描一个表中他关心的那一部分。
# Hive当前的是实现是。只有分区断言出现在离from子句最近的那个where子句中，才会取用分区剪枝。 
select * from app_vdp_base_jdbang_income_ma_sum where tx_dt>='2016-06-01' and tx_dt <='2016-06-31';

#limit查询语句
#Limit可以限制查询的记录数，查询的结果是随机选择的 
Select * from t1 limit 5; 
#如果需要查询top多少的数据，则需要使用下面的语句：
Select * from sales order by amount desc limit 5; 

#结果导出
#格式：hive –e  ‘查询语句’ > 文件名.txt   #将查询语句查询出来的结果导出到txt中 
hive - e 'select * from app.app_vdp_jdbang_jwang_xiadan_detail;' > wangsha1.txt 