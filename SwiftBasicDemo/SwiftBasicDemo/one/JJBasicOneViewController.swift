//
//  JJBasicOneViewController.swift
//  SwiftBasicDemo
//
//  Created by 播呗网络 on 2020/12/9.
//

import UIKit

class JJBasicOneViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "swift基础知识(一)"
        self.view.backgroundColor = .white
        
//        let area1 = getArea(a: 2, b: 4)
//        let area2 = getArea2(width: 3, height: 4)
//        print(area1,area2)
        
//        numOne()
    }
    
    
    // MARK: - 基本介绍
    
    ///这里只介绍一些初学swift的基本概念,需要提前了解的东西
    /*
     1.swift语法和OC不一样,OC每一行代码都是以分号";"结尾的,但是swift结尾是没有结尾标识符的
     2. 之前Swift非常注重格式，比如 `a = 3`，在`=`的左右必须都有一个空格。现在前后空格个数不一样，不会报错了，但是还是建议写的规范一些。
     3.OC调用方式的时候是,是类名或对象名+空格+方法名,然后用中括号括起来:[Person saveCall];
     swift是类名或对象名+.+方法名即可: person.saveCall ,类似与OC的点语法
     4.swift语法整体兼容OC,可以通过桥接和OC无缝对接
     5.swift语法风格整体类似于Java
     6.新建的swift类,只有一个.swift文件,没有.h文件和.m文件
     7.swift可以使用cocoapods,方法同OC一样
     8.不需要导入头文件,可以直接引用其他类里面的方法或属性
     9.swift没有宏这个概念
     10.swift没有类扩展一般写在最下面
     11.没有main.m文件  @UIApplicationMain是程序入口标识
     12.class 标示声明类  {} 用来标识类的范围
     13.构造函数 [xxx alloc] initWithXXX]  ==> xxx(XXX:) ;[alloc init] => ()
     14.UIButtonTypeContactAdd  => 枚举类型.枚举值(简写 .枚举值)
     15.在当前类中访问属性或者方法的时候 可以省略 self. 推荐不写, 后面的闭包中必须添加self.
     16.按钮的监听事件 使用 #selector
     17.整体语言风格类似java
     18.swift语言要求严格,属于静态语言.编译之前,就会对语法类型等,进行检测
     */
    
    /*----------------------------        Demo1        ----------------------------*/
    // MARK: - 常量和变量
    func testDemo1() {
        
        let a = 10
        // a = 2   ----> 会报错 let定义的变量不能改变,不能进行赋值
        print(a)   // ---> 打印使用print语法,不适用nslog
        
        
        var b = 20
        b = 30   //不会报错,var定义的变量是可以被修改的
        print(b)
        
        let c: Int = 10
        let d: CGFloat = 20.3
        /*
         swift是一个强类型的语言
         option + click 是swift开发的热键 没有之一
         Int 是swift中整数的默认类型(NSIbteger)
         小数默认类型是double
         let d: CGFloat = 20.3  这属于手动指定类型
         */
       
        // let res1 = c + d   -->  会报错
        let res2 = c + Int(d)
        print(res2)
        /*
         不同类型之间的运算
         swift中类型不一样的时候不能操作,没有银行形式的转换 需要coder手动转换数据
         转换类型: 通过类型调用构造函数 传递参数转换 ,或as语法
         */
        
        // let f: Int
        // print(f) //报错,未初始化之前都不能使用
    }
    
    
    
    /*--------------------------       Demo2      --------------------------------*/
    // MARK: - swift与OC的不同
    func testDemo2() {
        let myView = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        // myView.backgroundColor = UIColor.yellow
        myView.backgroundColor = #colorLiteral(red: 1, green: 0.3233583075, blue: 0.3979080506, alpha: 1)
        //color Literal属性
        
        let btn = UIButton(type: UIButton.ButtonType.custom)
        // let btn1 = UIButton(type: .contactAdd)  //可以简写 直接.+枚举
        myView.addSubview(btn)
        
        //添加到根视图
        view.addSubview(myView)
        
        //给按钮添加点击事件
        btn.addTarget(self, action: #selector(btnDidClick), for: .touchUpInside)
        
        
    }
    @objc func btnDidClick() {
        print("我被点击了")
    }
    
    /*--------------------------------       Demo3       --------------------------------*/
    // MARK: - 元组
    func testDemo3() {
        //元组可以吧多个值组合成一个复合值.元组内的数据可以是任意类型的,重点:不要求元素的类型相同
        //不想接收值,直接用下划线_代替
        //可以使用标签,类似于字典
        
        let xiaoming = (25,"小明","清华大学")
        print(xiaoming.0,xiaoming.1)
        
        let (age, name, _) = xiaoming
        print(age,name)
        
        let xiaozhou = (age: 29, name: "神合")
        print(xiaozhou.age,xiaozhou.name)

    }
    
    
    /*--------------------------------       Demo4      --------------------------------*/
    // MARK: - 可选类型
    func testDemo4() {
        //可选类型有可能有值,也有可能为nil
        //let声明可选类型是没有意义的
        //必选类型一定有值
        var a:Int? = 10
        a = nil
        print(a ?? 1)
        
        
        //这就是一个可选类型
        //不能够对可选类型做强制解包
        
        let b: Int? = 15
        let c = (b ?? 0) + 20
        let d = 10
        let res = 20 + d
        
        print(res,(b ?? 0),c,d)
        
        //可选类型不能够直接计算
        /*
         你是否需要使用'?'或者'!'进行解包
         -- '!'强制解包 一定要获取一个值 不能够为nil
         -- '?'可选解包 后面具体说
         -- 如果可选类型要进行计算的时候,系统会报错,需要程序员手动处理可选类型
         -- '!'强制解包有风险,需要谨慎使用,程序员需要对'!'负责  如果为nil 程序会崩溃
         -- 一定要考虑是否安全 一定有值 防患于未然
         -- '??' 合并空选项 必须提高 ?? 的优先级
         */
        
    }
    
    /*------------------------------       Demo5       -------------------------------*/
    // MARK: - 分支结构
    func testDemo5() {
        //1.分支结构 if语句
        /*
         1. 条件语句没有 () ,可以写 但不推荐写
         2. 分支结构必须有 {}
         3. 没有 非零即真的概念,只有 true 和 false
         */
        var a = 13
        a = Int(arc4random_uniform(18))
        if a < 14 {
            print("小,很小,非常小")
        } else {
            print("大,很大,非常大")
        }
        
        //2. if let
        //模拟网络请求
        let urlString = "http://www.zxhkit.com"
        let url = URL(string: urlString)
        if url != nil {
            let req1 = URLRequest(url: url!)
            print(req1)
        }
        
        //swift特有的写法 if let 和 guard
        //上面的if还可以写成这样
        if let url2 = URL(string: urlString) {
            let req2 = URLRequest(url: url2)
            print(req2)
        }
        
        //只有当url2不为空的时候,才会执行里面的代码
        
       //3. guard(守卫) let else
        /*
         作用与if let 相反
         guard let 能够减少一层分支嵌套
         */
        
        let urlStr = "http://www.zxhkit.com"
        guard let url1 = URL(string: urlStr) else {
            //不希望guard 能够被穿透
            //如果url1 为nil 就进入else 分支 会直接return
            return
        }
        
        let req3 = URLRequest(url: url1)
        print(req3)

        //4.guard 多个可选值的判断
        var age1: Int?
        var age2: Int?
        
        age1 = 15
        age2 = 20
        
        if age1 != nil && age2 == nil {
            print(age1!,age2!)
        }
        
        guard let _ = age1,let _ = age2 else {
            return;
        }
        
        //5.switch
        /*
         1.不需要写break
         2.每个匹配项中至少有一段代码可以执行
         3.可以判断任意类型
         4.一次可以匹配多个值
         5.在匹配项中可以声明临时变量,而且不需要加 {} 限制作用域
         */
        
        let x = "20000"
        switch x {
        case "20000","30000":
            print("架构师")
        case "18000":
            print("高级开发工程师")
        case "12000":
            print("中级开发工程师")
        case "6000":
            print("菜逼")
        default:
            print("逗比")
        }
                
    }
    
    
    /*------------------------------         Demo6        ------------------------------*/
    // MARK: - 循环
    func testDemo6() {
        
        // while语句
        var num = 5
        while num > 0 {
            print(num)
            num -= 1
        }
        //打印结果:
        /*
        5
        4
        3
        2
        1
        */
        
        //repeat-while相当于OC中的do-while
        var ber = -4
        repeat {
            ber += 1
            print(ber)
        } while(ber > 0);
        
        
        // 循环的范围可以直接定义出来使用
        let range = 0...10
        for i in range {
            print(i)
        }
        print("----------------------")
        
        //遍历0到10,不加包括10,   0..<10 表示不包括10
        for i in 0..<10 {
            print(i)
        }
        
        
        //对没有使用的变量或者常量在编译的时候可以忽略
        for _ in 0..<10 {
            print("😑")
        }
        
        print("----------------------")

        let names = ["anni","roky","lily","bob","jeem"]
        for name in names {
            print(name)
            //这里可以打印出来每一个元素值
        }
        
        for name in names[0...2] {
            //只会打印前三个
            print(name)
        }
        
        for name in names[..<2] {
            //半开区间,只会打印前三个
            print(name)
        }
        
        
        //continue和break的使用
        //break将直接跳出当前循环
        //continue继续当前循环,但是continue后面的代码不再执行
        for i in 1...10 {
            if i == 2 {
                continue
            }
            if i > 7 {
                break
            }
            print(i)
        }
        
        

    }
    
    /*---------------------------        Demo7        -----------------------------*/
    // MARK: - range
    func testDemo7() {

        // 补偿一点:range
        let range = 0...9
        let isHave = range.contains(4)
        print(isHave)//结果是怎么样的呢
        
        let range1: ClosedRange<Int> = 1...5
        let range2: Range<Int> = 1..<6
        let range3: PartialRangeThrough<Int> = ...5

        print(range1,range2,range3)
        
        
        let strRange1 = "a"..."f"
        let isRh = strRange1.contains("b")//结果:true
        
        let strRange2 = "cc"..."ff"
        let isRh1 = strRange2.contains("cb")//结果:false
        let isRh2 = strRange2.contains("dz")//结果:true
        let isRh3 = strRange2.contains("fg")//结果:false

        print(isRh,isRh1,isRh2,isRh3)
        
        //从打印结果看,表示两个字母都必须在这个范围内
        
        let time = 13
        let margin = 2
        for item in stride(from: 4, through: time, by: margin) {
            print(item)
            //表示从4开始,一次累加2,直到13(不超过13)
        }
        
        
    }
    /*----------------------------------------------------------------------------*/
    
    // MARK: - 字符串
    func testDemo8() {
        //字符串的本质是结构体
        let str: String = "长得帅可以撩妹,长丑是骚扰"
        //String和NSString可以相互转换
        let NSstr = str as NSString
        print(NSstr)
        
        //字符串的基本属性
        let str1 = "长得帅可以撩妹,长丑是骚扰"
        //长度
        let len = str1.lengthOfBytes(using: .utf8)
        print(len)
        //字符集合
        let length = str1.count
        print(length)

        //遍历字符串
        for character in str1 {
            print(character)
        }
        
        
        //使用 + 来拼接字符串
        let str2 = "别低头,绿帽会掉"
        let str3 = "别哭泣,老王会笑"
        let res1 = str2 + str3
        print(res1)
        let name = "王哥"
        let age = 13
        // : \() 转义符号 转义字符串
        let res2 = name + String(age)
        let res3 = name + "\(age)"
        let res4 = "\(name)\(age)"
        print(res2,res3,res4)
        
        
        //格式化字符串
        let z = 9
        let x = 1
        let h = 20
        // 09:01:20
        //可以接受可变参数
        let res5 = String(format: "%02d:%02d:%02d", z,x,h)
        print(res5)
        
        
        //字符串的截取
        let str4 = "我喜欢手指在键盘上飞舞的感觉"
        let start = str4.index(str4.startIndex, offsetBy: 3)
        let sub1 = str4.suffix(3)
        let sub2 = str4.suffix(from: start)
        
        print(sub1,sub2)
        
    }
    /*----------------------------------------------------------------------------*/
    // MARK: - 集合:数组,字典
    func testDemo9() {
        //1.数组的声明 和 空数组的实例化
        //不推荐在数组中放不同的元素
        let array: [Any] = ["阿大,阿二,阿三",18]
        print(array)
        
        //实例化空数组
        //常量类型的空数组没有意义
        var emptyArray = [String]()
        
        
        //2.增删改查
        //var表示可变数组
        var arr = ["大哥","二哥","三哥","四哥"]
        //增
        arr.append("老司机")
        //改
        arr[0] = "姐姐"
        //删
        arr.remove(at: 1)
        //查
        for str in arr {
            print(str)
        }
        
        //倒序遍历
        for str in arr.reversed() {
            print(str)
        }
        
        //同时遍历角标和对应的值
        for (index,value) in arr.enumerated().reversed() {
            print(index)
            print(value)
        }
        
        
        //3.数组的合并
        let array1: [Any] = ["老张","老李",19]
        let array2: [Any] = ["大哥","大姐",23]
        let array3 = array1 + array2
        print(array3)
        
        
        //4.字典
        /*
         同样是使用[] 来声明
         [String : Any] 是最常见的字典格式
         */
        let dict: [String : Any] = ["name" : "玄哥","age" : "21"]
        print(dict)
        //声明空字典
        var emptyDict = [String : Any]()
        emptyDict["key"] = "eee"
        var dic: [String : Any] = ["name" : "玄哥","age" : "21"]

        //增
        dic["love"] = "镜子"
        //改
        dic["love"] = "小镜子"
        //删
       // dic.removeAll()
        dic.removeValue(forKey: "age")
        //遍历
        for (key,value) in dic {
            print(key,value)
        }
        
    }
    
    
    
    /*------------------------          wherr          ----------------------------*/
    // MARK: - where
    func testDemo10() {
        
        //where搭配switch语法的使用
        let point = (1, 1)
        switch point {
        case let (x, y) where x == y :
            print("特殊点",x,y)
            break
        default:
            break
        }
        
        //where搭配for循环语法的使用
        
        let items = [12,14,23,42,23,100]
        
        for item in items where item > 99 {
            print(item)
            //结果:100
        }
        //从上面列子可以看出where就是一个条件选择
        
    }
    
    /*-----------------------      testDemo11      -----------------------*/
    //testDemo11
    // MARK: - 函数
    func getArea(a: Int,b: Int) -> Int {
        return a * b
    }
    //width 表示外部参数 a 和 b 标识函数的内部参数只能够在内部使用
    //能够让函数的可读性更强,同时也能够让函数在内部使用参数更加简单
    func getArea2(width a:Int,height b: Int) -> Int {
        return a * b
    }
    
    //函数的内部函数
    func numOne() {
        
        func numTwo(a: Int,b: Int) {
            print(a * b)
        }
        //内部调用
        numTwo(a: 2, b: 4)
    }

}
