//
//  SecondViewController.swift
//  SwiftSinpleDemo
//  作者:香蕉大大  简书地址：http://www.jianshu.com/users/a3ae6d7c68b6/latest_articles
//  微博:http://weibo.com/u/6013257513?is_all=1
//  QQ技术讨论交流群 : 365204530
//  微信个人技术公众号：大大家的IOS说（一起用碎片时间学习最新最有用的IOS资料）

import UIKit

//类似于OC中的typedef
typealias sendValueClosure=(_ str:String)->Void;

class SecondViewController: UIViewController {
    //定义一个block
    var mySendBlock:sendValueClosure?
    //定义一个属性,作为回传的属性值
    var myStr : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    @IBAction func notiAction(_ sender: AnyObject) {
        notiAction();
        
        
    }
    //返回的值
    @IBAction func backAction(_ sender: AnyObject)
    {
        print("没有进来吗?")
        /*
         判断闭包存在不,然后进行传值
         */
        if (mySendBlock != nil) {
            mySendBlock!("你好");
        }
        //MARK: - 属性回传值
        myStr = "回传回来的属性值数据~"
        
        self.dismiss(animated: true, completion: nil);
        
    }
    
    @IBAction func localAction(_ sender: AnyObject) {
        readUser();
        
        
        
    }
    
    func readUser() -> Void {
        let str =  UserDefaults.standard.object(forKey: "hun")
        print("获取的本地话存储值\(str)")
    }
    
    func notiAction() -> Void {
        var dic : [String : String] = [:]
        dic["lbName"] = "通知传值"
        dic["lbCode"] = "密码值"
        //设置通知的名称
        let NotifyChatMsgRecv = NSNotification.Name(rawValue:"post")
        NotificationCenter.default.post(name:NotifyChatMsgRecv, object: nil, userInfo: dic)
    }


}
