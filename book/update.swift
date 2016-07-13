//
//  update.swift
//  book
//
//  Created by 20141105039 on 16/7/13.
//  Copyright © 2016年 srf. All rights reserved.
//

import UIKit

class update: UIViewController {
          
          var db:SQLiteDB!
          
          @IBOutlet weak var updatename: UITextField!
          @IBOutlet weak var updatenum: UITextField!
          
          @IBOutlet weak var text1: UITextField!
          override func viewDidLoad() {
                    super.viewDidLoad()
                    // Do any additional setup after loading the view, typically from a nib.
                    db = SQLiteDB.sharedInstance()
                    //如果表还不存在则创建表（其中uid为自增主键）
                    db.execute("create table if not exists tuser(uid integer primary key,name varchar(20),mobile varchar(20),email varcher(20),address varcher(20))")
          }
          
          @IBAction func updatesave(sender: AnyObject) {
                    save()
                    showAlert()
          }
          func save(){
                    let x=updatename.text!
                    let y=updatenum.text!
                    let sql = "update user set mobile='\(y)' where uname='\(x)'"
                    print("sql:\(sql)")
                    let result = db.execute(sql)
                    print(result)
          }
          func showAlert() {
                    var alert = UIAlertView(title: "提示",message: " 更改联系人电话成功！",delegate: self,cancelButtonTitle: "确定")
                    alert.alertViewStyle = UIAlertViewStyle.Default
                    alert.show()
          }
          
          
          
                    
          override func didReceiveMemoryWarning() {
                    super.didReceiveMemoryWarning()
                    // Dispose of any resources that can be recreated.
          }
          
          
}
