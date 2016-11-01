//
//  ViewController.swift
//  SwiftSinpleDemo
//  作者:香蕉大大  简书地址：http://www.jianshu.com/users/a3ae6d7c68b6/latest_articles
//  微博:http://weibo.com/u/6013257513?is_all=1
//  QQ技术讨论交流群 : 365204530
//  微信个人技术公众号：大大家的IOS说（一起用碎片时间学习最新最有用的IOS资料）

import UIKit


class ViewController: UIViewController {
    //显示的LB
    @IBOutlet weak var showLB: UILabel!
    //现实的属性LB
    @IBOutlet weak var PropertyLB: UILabel!
    
    //作为全局变量,先使用一个初始化后的值
    var secVC : SecondViewController = SecondViewController();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK : - 接收通知
        let NotifyChatMsgRecv = NSNotification.Name(rawValue:"post")
        NotificationCenter.default.addObserver(self, selector:#selector(didMsgRecv(notification:)),
                                               name: NotifyChatMsgRecv, object: nil)
    }
    //通知处理函数
    func didMsgRecv(notification:NSNotification){
        print("didMsgRecv: \(notification.userInfo)")
    }

    //MARK: - 属性传值,传回来数据
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("进来这句话")
        if (secVC.myStr != "") {
            PropertyLB.text = secVC.myStr;
        }
        
    }
//MARK: - 这是是莪用segue传值的方法,使用的是block
    /*
        构造一个本类的block
        让这个block等于block的属性
     */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc : SecondViewController = segue.destination as! SecondViewController;
        vc.mySendBlock = myblock;
        //把值作为全局变量
        secVC = vc
    }
    
    func myblock(str:String) -> Void {
        showLB.text = str;
        
    }
    
    @IBAction func userDo(_ sender: AnyObject)
    {
        userAction(str: "存储的值");
        
    }
    
    //MARK: - 本地化传值
    func userAction(str :String) -> Void {
        UserDefaults.standard.set(str, forKey: "hun")
    }
    
    
    
    //MARK: - 单例的使用按钮
    @IBAction func singleAction(_ sender: AnyObject) {
        //这是方法1
        print(Unmanaged.passUnretained(single).toOpaque())
        
        //这是方法2
        let b = Single.sharedInstance2;
        print(Unmanaged.passUnretained(b).toOpaque())
        
        //这是方法3
        print(Unmanaged.passUnretained(Single.shareInstance3).toOpaque())
        
    }

}

