//
//  main.swift
//  Lesson1
//  11 - 5
//  作者:香蕉大大  简书地址：http://www.jianshu.com/users/a3ae6d7c68b6/latest_articles
//  微博:Hundred大大   http://weibo.com/u/6013257513?is_all=1
//  QQ技术讨论交流群 : 365204530
//  微信个人技术公众号：大大家的IOS说（一起用碎片时间学习最新最有用的IOS资料）
//  微信个人账号：hundreda

import Foundation
import AppKit

// MARK: - 关键字

// MARK: - 1.inout 这里in-out作为函数声明时，引用传值的关键字。相当于C#和Java中得ref和out。但是在函数调用的时候要写一个“&”符号在参数前面。
func swapTwoInts( a: inout Int, b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}
var someInt = 3
var anotherInt = 107
swapTwoInts(a: &someInt, b: &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")


//MARK: - 2. get set and willSet didSet
/* 由于项目是MACOC加载不出,使用方法如下
struct AlternativeRect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set {
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
    }
}
 */

//MARK: - 3. 懒加载  lazy

class Head{
    var eyes = "eyes"
    var nose = "Nose"
}
class Arm{
    var hands = "hands"
}
class Human{
    lazy var head = Head()
    lazy var arm = Arm()
}

var human = Human()
var newhead = Head()
newhead.eyes = "blueeyes"
human.head = newhead

//MARK: - 4. protocol  与OC里面的@property(readonly)...
//其实这也比较像C#,以前的oc是不支持protocol中有属性的，仅仅是个方法列表。
protocol SomeProtocol {
    var mustBeSettable: Int { get set }
    var doesNotNeedToBeSettable: Int { get }
}

//MARK: - 5.willSet和didSet是两个非常好玩的东西。可以对属性赋值前和赋值后进行一定的操作：
//这种方法对于写一个客户端app增加了极大的灵活性，把willSet和didSet封装到class中有助于我们更方便的控制对象的属性。
class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("About to set totalSteps to \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue  {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}
let stepCounter = StepCounter()
stepCounter.totalSteps = 200
// About to set totalSteps to 200
// Added 200 steps
stepCounter.totalSteps = 360
// About to set totalSteps to 360
// Added 160 steps
stepCounter.totalSteps = 896
// About to set totalSteps to 896
// Added 536 steps


//MARK: -  6.mutating
/*
 这个关键字至少我是第一次见，他的作用是写在func前面，以便让func可以修改struct和protocol的extension中的成员的值。如果不加此关键字，成员值便被保护起来，不得修改。
 
 例如：
 */

struct Point {
    var x = 0.0, y = 0.0
    mutating func moveByX(deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
    }
}
var somePoint = Point(x: 1.0, y: 1.0)
somePoint.moveByX(deltaX: 2.0, y: 3.0)
print("The point is now at (\(somePoint.x), \(somePoint.y))")


//MARK: - 7 .class var
// 在swift中对于enum和struct来说支持用static关键字来标示静态变量，但是对于class成员来说，只能以class var的方式返回一个只读值。如下：

struct SomeStructure {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        // return an Int value here
        //这是展示罢了,如果不加return编译器会自动报错,严谨性非常好
        return 1
    }
}
enum SomeEnumeration {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        // return an Int value here
        return 1
    }
}
class SomeClass {
    class var computedTypeProperty: Int {
        // return an Int value here
        return 1
    }
}

//MARK:- 8 subscript syntax
/*
 
 所谓subscript就是用[]来进行索引，这种语法十分灵活，可能借鉴了一些Python的风格。
 
 如struct、array、dictionary都可以通过subscript进行索引：
 */
struct Duden {
    let offset:Int
    var textCount:Int
    subscript(index:Int) -> Int{
        get{
            return index - offset
        }
        set(newvalue){
            textCount = newvalue * 3
        }
    }
}

var duden = Duden(offset:2,textCount:0)

duden[9] = 8  //duden.textCount  24
print(duden.textCount)

//MARK:- 9 convenience
/*
 convenience用来进行方便的初始化，说白了就相当于构造函数重载，对于class来讲，默认或指定的初始化方法作为所谓的Designated初始化，若重载的初始化需要调用Designated初始化则将它作为convenience初始化，在方法前要加上convenience关键字。
 */

class Figure{
    var name:String!
    var nikname:String?
    init(){
        name = "John"
    }
    convenience init(name:String!,nikname:String!){
        self.init()
        self.name = name
        self.nikname = nikname
    }
}

