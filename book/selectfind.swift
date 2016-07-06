//
//  selectfind.swift
//  book
//
//  Created by 20141105039 on 16/7/6.
//  Copyright © 2016年 srf. All rights reserved.
//

import UIKit

class selectfind: UIViewController {
          
          var db:SQLiteDB!
          
          
          
          @IBOutlet weak var textf: UITextField!
          @IBOutlet weak var textf1: UITextView!
          override func viewDidLoad() {
                    super.viewDidLoad()
                    // Do any additional setup after loading the view, typically from a nib.
                    db = SQLiteDB.sharedInstance()
                    //如果表还不存在则创建表（其中uid为自增主键）
                    db.execute("create table if not exists tuser(uid integer primary key,name varchar(20),mobile varchar(20),email varcher(20),address varcher(20))")
          }
          
          
          
          
          
          @IBAction func selectf(sender: AnyObject) {
                    sf()
          }
          func sf(){
                    textf1.text=""
                    let a=textf.text!
                    let data = db.query("select * from user where uname='\(a)'")
                    for (var i=0;i<data.count;i++)
                    {//获取最后一行数据显示
                              let tuser = data[i]
                              textf1.text! += "姓名：" + String(tuser["uname"]!) + " 电话：" + String(tuser["mobile"]!)  + " email：" + String(tuser["email"]!) +  " 地址：" + String(tuser["address"]!)+"\n"
                    }
                    

                    
          }
          override func didReceiveMemoryWarning() {
                    super.didReceiveMemoryWarning()
                    // Dispose of any resources that can be recreated.
          }
          
          
}
