# encoding: utf-8
__author__ = 'mtianyan'
__date__ = '2018/1/17 0017 19:50'
from scrapy.cmdline import execute

import sys
import os

# 将项目根目录加入系统环境变量中。
# os.path.abspath(__file__)为当前文件所在绝对路径
# os.path.dirname() 获取文件的父目录。

sys.path.append(os.path.dirname(os.path.abspath(__file__)))

print(os.path.abspath(__file__))
# D:\CodeSpace\PythonProject\ArticleSpider\main.py

print(os.path.dirname(os.path.abspath(__file__)))
# D:\CodeSpace\PythonProject\ArticleSpider
#获取当前使用的操作系统
print(os.name)
#得到当前工作的目录
print(os.getcwd())
#指定所有目录下，所有的文件和目录名
print(os.listdir())
#创建目录
"""os.mkdir()"""
"""os.mkdirs()"""
#删除指定文件
"""os.remove()"""
#删除指定目录
""""os.rmdir()"""
#判断指定对象是否为文件
"""os.path.isfile()"""
#判断指定对象是否为目录
"""os.path.isdir()"""
#判断指定的对象是否存在
"""os.path.exists()"""
#返回路径的目录和文件名
"""os.path.split()"""
files = os.path.split(os.getcwd())
for file in files:
    print(file)
#执行shell命令
os.system("echo 'hello world!'")
#改变目录到指定目录
"""os.chdir()"""
#连接目录和文件名
""""os.path.join()"""
#获得文件的大小
""""os.path.getsize()"""
#返回文件名
""""os.path.basename()"""
#获得绝对路径
"""os.path.abspath()"""
#返回文件名
"""os.path.dirname(path)"""
# 调用execute函数执行scrapy命令，相当于在控制台cmd输入该命令
# 可以传递一个数组参数进来:
# execute(["scrapy", "crawl" , "jobbole"])

#execute(["scrapy", "crawl" , "zhihu"])

# execute(["scrapy", "crawl" , "lagou"])

# execute(["scrapy", "crawl" , "fang"])