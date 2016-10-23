//
//  Single.swift
//  SwiftSinpleDemo
//
//  Created by HUN on 16/10/22.
//  Copyright © 2016年 com.hundred.valueTransfer. All rights reserved.
//

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
