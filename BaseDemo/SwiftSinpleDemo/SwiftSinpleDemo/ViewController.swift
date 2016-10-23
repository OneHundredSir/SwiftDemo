//
//  ViewController.swift
//  SwiftSinpleDemo
//
//  Created by HUN on 16/10/22.
//  Copyright © 2016年 com.hundred.valueTransfer. All rights reserved.
//

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

