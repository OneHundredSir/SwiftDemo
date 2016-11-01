//
//  Single.swift
//  SwiftSinpleDemo
//  作者:香蕉大大  简书地址：http://www.jianshu.com/users/a3ae6d7c68b6/latest_articles
//  微博:http://weibo.com/u/6013257513?is_all=1
//  QQ技术讨论交流群 : 365204530
//  微信个人技术公众号：大大家的IOS说（一起用碎片时间学习最新最有用的IOS资料）

import UIKit

//MARK: 单例:方法2
let single = Single()


class Single: NSObject {
    //MARK - : 单例:方法1
    static let shareSingleOne = Single()

    //-MARK: 单例:方法2
    class var sharedInstance2 : Single {
            return single
    }
    
    //-MARK: 单例:方法3
    static var shareInstance3:Single{
        struct MyStatic{
            static var instance :Single = Single()
        }
        return MyStatic.instance;
    }
    
    func hun() -> Void {
        
    }
    
    
    // MARK:单例方法4:用线程 此方法swift 3.0已经弃用了,请使用第一种方法
/*
    class func shareSingle()-> Single {
        struct singleTon{
            //一次
            static var onceToken : dispatch_once_t = 0
            static var instance: Single? = nil
        }
         dispatch_once(&Static.onceToken) {
         Static.instance = Single()
         }
         return Static.instance!
    }
*/

    
}
