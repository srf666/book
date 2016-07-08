//
//  selectdelet.swift
//  book
//
//  Created by 20141105039 on 16/7/4.
//  Copyright © 2016年 srf. All rights reserved.
//

import UIKit

class selectdelete: UIViewController {
          
          var db:SQLiteDB!
          

          @IBOutlet weak var text1: UITextField!
          override func viewDidLoad() {
                    super.viewDidLoad()
                    // Do any additional setup after loading the view, typically from a nib.
                    db = SQLiteDB.sharedInstance()
                    //如果表还不存在则创建表（其中uid为自增主键）
                    db.execute("create table if not exists tuser(uid integer primary key,name varchar(20),mobile varchar(20),email varcher(20),address varcher(20))")
          }
          
          
          
          
          @IBAction func delet(sender: AnyObject) {
                    del()
          }
          
          @IBAction func delet1(sender: AnyObject) {
                    del1()
          }
          func del(){
                    let a=text1.text!
                    let sql = "delete from user where uname='\(a)'"
                    let result = db.execute(sql)
                    print(result)
                    
          }
          func del1(){
                    let a=text1.text!
                    let sql = "delete from user where mobile='\(a)'"
                    let result = db.execute(sql)
                    print(result)
                    
          }

          override func didReceiveMemoryWarning() {
                    super.didReceiveMemoryWarning()
                    // Dispose of any resources that can be recreated.
          }
          
          
}
