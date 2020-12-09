//
//  Person.swift
//  Swift进阶知识1
//
//  Created by rookie on 2018/3/5.
//  Copyright © 2018年 zxh. All rights reserved.
//

import UIKit

//必选属性在真正的开发中用的地方很少,但是我们需要用必选属性来研究对象的构造过程
class Person: NSObject {
    
    var name: String
    
    
    //override 重写 面向对象的重要特征,父类已经存在的方法或者属性,子类需要做特殊的操作 可以重写
    //重写的特点:在方法的内部可以super
    //构造方法必须对 必选属性 负责,对象构造成功之后,必选属性必须有值
    //对象的初始化分段进行,先初始化子类(给必选属性赋值),再初始化父类
    //super.init  是对象构造结束的标记
    override init() {
        //在隐式生成super.init 之前没有给self.name设置初始值,会报错
        name = "小明"
        super.init()
        
        /*
         下面这个写法会报错,先写
         super.init()
         name = "1"
         */
        
        memeda()
    }
    
    
    //添加一个对象方法
    
    func memeda() {
        print("么么哒")
    }
    
    
}
