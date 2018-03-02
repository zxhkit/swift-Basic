# swift-Basic
这是一个swift入门的基础知识.解释说明可以参考:https://www.jianshu.com/p/3b01707fed18

swift是一门新的语言,不过现在已经出到swift4了,也不信了,今天不介绍这些.很多人想学swift,不知从何开始,今天我就简单说下入门知识,我认为在学习swift之间最好先把这些基本的知识掌握了,才能更好的去认识它学习它,使用它.

一、基本介绍

这里只介绍一些初学swift的基本概念,需要提前了解的东西

1.swift语法和OC不一样,OC每一行代码都是以分号";"结尾的,但是swift结尾是没有结尾标识符的   
2.OC只要语法正确就可以,不用整理格式,但是swift非常注重格式,比如 a = 3 ,在=的左右必须都有一个空格,或同时有多个,当=左右空格个数不一样时,比如 b= 2 这样会报错  
3.OC调用方式的时候是,是类名或对象名+空格+方法名,然后用中括号括起来:[Person saveCall]; swift是类名或对象名+.+方法名即可: person.saveCall ,类似与OC的点语法  
4.swift语法整体兼容OC,可以通过桥接和OC无缝对接  
5swift语法风格整体类似于Java  
6.新建的swift类,只有一个.swift文件,没有.h文件和.m文件   
7.swift可以使用cocoapods,方法同OC一样   
8.不需要导入头文件,可以直接引用其他类里面的方法或属性   
9.swift没有宏这个概念   
10.swift没有类扩展这个概念  
11.没有main.m文件 @UIApplicationMain是程序入口标识    
12.class 标示声明类 {} 用来标识类的范围    
13.构造函数 [xxx alloc] initWithXXX] ==> xxx(XXX:)   [alloc init] => ()   
14.UIButtonTypeContactAdd => 枚举类型.枚举值(简写 .枚举值)   
15.在当前类中访问属性或者方法的时候 可以省略 self. 推荐不写, 后面的闭包中必须添加self.   
16.按钮的监听事件 使用 #selector   

二、常见和变量  
参考:https://www.jianshu.com/p/3b01707fed18  

三、 swift与OC的不同演示 

参考:https://www.jianshu.com/p/3b01707fed18     

四、可选类型  
参考:https://www.jianshu.com/p/3b01707fed18  

五、分支结构   
参考:https://www.jianshu.com/p/3b01707fed18  

六、循环   
参考:https://www.jianshu.com/p/3b01707fed18  

七、字符串  
参考:https://www.jianshu.com/p/3b01707fed18  

八、集合: 数组,字典  
参考:https://www.jianshu.com/p/3b01707fed18  

九、函数(方法)  
参考:https://www.jianshu.com/p/3b01707fed18  

这只是入门知识,把这些看懂后就可以写一些简单的demo了.   
学习swift还有一个很好的教材,那就文档,很多不喜欢看文档最主要的原因是因为,看不懂英文.还好swift有中文版的文档:swift4中文文档   
配合学习,加油 加油!!!   









