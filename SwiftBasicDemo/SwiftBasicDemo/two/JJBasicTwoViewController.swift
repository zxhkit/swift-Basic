//
//  JJBasicTwoViewController.swift
//  SwiftBasicDemo
//
//  Created by 播呗网络 on 2020/12/9.
//

import UIKit


class JJBasicTwoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "swift基础知识(二)"
        self.view.backgroundColor = .white
        
        fiveDemo()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    /*-------------------------------------知识点分割线----------------------------------------*/
    // MARK: - swift进阶知识须知
    /*
     我在上一篇文章中简单介绍了一下基础知识,认真看完基础知识后,大多数人应该可以试着开发一个小demo.
     但是想写一个功能性的demo,还是不行的,还是有很多东西我们需要了解.
     在看这篇文章(demo)前,我建议把入门的基础知识先了解一下.
     参考链接:https://www.jianshu.com/p/3b01707fed18
     参考demo:https://github.com/zxhkit/swift-Basic
     */
    
    
    /*-------------------------------------知识点分割线----------------------------------------*/
    // MARK: - 闭包的基本格式
    /*
     闭包是swift中常用的一个知识点
     闭包和OC中的block类似
     1.闭包是提前定义的一段可以执行的代码块
     2.可以当做参数 在函数中传递
     3.在需要的时候执行代码块引用,完成回调的作用
     4.在block中如果访问到了self或者其属性的时候,要注意考虑循环引用
     */
    
    //我通过几个例子来展示闭包的使用方法
    
    //1.没有参数没有返回值的闭包
    
    //使用闭包来实现demo1A
    //() -> ()没有参数没有返回值的闭包
    func demo1B() {
        let closure: () -> () = { () -> () in
            print("我是一个没有参数没有返回值的闭包")
        }
        //执行闭包
        closure()
    }
    
    func demo1A() {
        func sum(){
            print("我是一个没有参数没有返回值的方法")
        }
        sum()   //调用方法
    }
    
    //2.有参数没有返回值的闭包
    /*
     闭包是一个封闭的结构:闭包的参数,返回值 和闭包需要执行的代码片段都应该在闭包的内部
     in 是一个分割的标记
     */
    //使用闭包来实现demo2A
    func demo2B() {
        let closure = { (a: Int,b: Int) -> () in
            let res = a + b
            print(res)
        }
        //执行闭包
        closure(2, 3)
    }
    
    
    func demo2A() {
        func sum(a: Int,b: Int){
            let res = a + b
            print(res)
        }
        sum(a: 2, b: 3)  //执行
    }
    
    //3.有参数有返回值的闭包
    func demo3B() {
        let closure = { (a: Int,b: Int) -> Int in
            let res = a + b
            return res
        }
        //执行闭包
        //回调结果应该放在参数部分还是返回值部分??
        //放在参数部分来进行回调
        let res = closure(3, 3)
        print(res)
    }
    
    /*-------------------------------------知识点分割线----------------------------------------*/
    // MARK: - 闭包的调用
    /*
     闭包可作为函数的参数来调用,执行回调
     */
    func secondDemo() {
        
        //在函数中传递闭包
        loadData { (result) in
            print(result)
        }
        //尾随闭包
        //1.系统会帮你简写,不需要coder手动简写
        //2.简写的规律:当函数最后一个参数是闭包的时候,函数的参数的 '()' 会提前关闭
        //如果函数只有闭包一个参数 '()'可以省略
        loadData(userName: "小明") { (result) in
            print(result)
        }
    }
    
    //模拟网络请求
    func loadData(finishedCallBack: @escaping (String) -> ()) {
        //1.在全局队列中做耗时操作
        DispatchQueue.global().async {
            //在全局队列中休眠
            Thread.sleep(forTimeInterval: 1)
            //2.在主队列中回调数据
            DispatchQueue.main.async {
                //执行闭包
                finishedCallBack("哈哈哈哈哈哈哈哈哈")
            }
        }
    }
    
    func loadData(userName: String,finishedCallBack: @escaping (String) -> ()) {
        //1.在全局队列中做耗时操作
        DispatchQueue.global().async {
            //在全局队列中休眠
            Thread.sleep(forTimeInterval: 1)
            //2.在主队列中回调数据
            DispatchQueue.main.async {
                //执行闭包
                finishedCallBack("嘎嘎嘎嘎嘎嘎嘎")
            }
        }
    }
    
    /*-------------------------------------知识点分割线----------------------------------------*/
    // MARK: - 闭包的循环调用
    //闭包和OC的Block类似,都有可能造成循环引用
    /*
     第一种方式: weak self 当self被系统回收时,self的地址会自动指向nil
            - 和OC中的 __weak 类似
     第二种方法: [unowned self]当self被系统回收时,self的地址不会自动指向nil ,有可能导致坏地址,野指针
            - 和OC中的 __unsafe_unretained 关键字的作用类似
     */
    
    //可选解包有什么作用呢?
    //调用方法或者属性的时候 使用可选解包,如果调用的对象为nil 就不会继续执行
    
    //1.模仿OC的解决方式
    func swiftMethodInOC() {
        weak var weakSelf = self
        loadData { (result) in
            print(weakSelf?.view ?? "2")
        }
    }
    //2.unowned
    func swiftClosureMethod() {
        loadData { [unowned self] (result) in
            
            print(self.view)
        }
    }
    
    /*-------------------------------------知识点分割线----------------------------------------*/
    // MARK: - swift命名空间
    /*
     我们在swift中调用其他类,不需要导入头文件
     这是因为swift支持命名空间
     在同一个命名空间中(以项目为一个维度),默认所有的文件共享, 不需要导入头文件
     */
    
    /*-------------------------------------知识点分割线----------------------------------------*/
    // MARK: - 面向对象的必选属性
    // 此项目工程中的 Person 类 和 Student 类,也是该知识点
    
    func fiveDemo() {
        let p = Person()
        print(p.name)
        
        let s = Student()
        print(s.number,s.name)
    }
    
    
}
