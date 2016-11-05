//
//  main.swift
//  Lesson1
//
//  作者:香蕉大大  简书地址：http://www.jianshu.com/users/a3ae6d7c68b6/latest_articles
//  微博:Hundred大大   http://weibo.com/u/6013257513?is_all=1
//  QQ技术讨论交流群 : 365204530
//  微信个人技术公众号：大大家的IOS说（一起用碎片时间学习最新最有用的IOS资料）
//  微信个人账号：hundreda

import Foundation

print("Hello, World!")

var 香蕉大大 = "你好哈"
print(香蕉大大)

var 😡 = "香蕉先生"
print("这是中文变量的输入值"+香蕉大大,"这是另一句话"+😡)


let num = [10,20,30,40,21]

let numsorted = num.sorted { (n1:Int, n2:Int) -> Bool in
    return n2>n1
}

let str = "1237asd"
let value = Int(str)
		
