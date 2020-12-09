//
//  Man.swift
//  Swift进阶知识02
//
//  Created by rookie on 2018/3/5.
//  Copyright © 2018年 zxh. All rights reserved.
//

import UIKit

//使用KVC的时候 不需要使用必选实型
//KVC是OC机制
class Man: NSObject {

    //nil 和 0的区别,nil是没有分配内存空间,'0'分配了内存空间
    //在Swift中使用KVC的时候,基本数据类型不能够设置为可选类型
   @objc var age: Int = 0
   @objc var name: String?
   @objc var sid: String?
    
    override init() {
        name = "小明"
        super.init()
    }
    
    init(name: String) {
        self.name = name
        super.init()
    }
    
    
    //通过字典来实例化对象  ==> KVC
    init(dict: [String : Any]) {
        super.init()
        
        //调用self的setValuesForKeys
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forKey key: String) {
        if key == "id" {
            setValue(value, forKey: "sid")
            return
        }
        super.setValue(value, forKey: key)
    }
    
   override func setValue(_ value: Any?, forUndefinedKey key: String) {
         //空实现
    }
    
    /*------------------------------便利构造函数-------------------------------------*/
    //便利构造函数
    
    //需要对构造的条件做判断
    //构造器可以构造失败 , 构造的对象是一个可选类型
    //便利的构造函数只负责本类的一些便利构造
    
    convenience init?(name: String,age: Int) {
        if age < 0 || age > 190 {
            return nil
        }
        
        //符合条件的就创建对象
        self.init(dict: ["name" : name, "age" : age])
    }
    
    
}
