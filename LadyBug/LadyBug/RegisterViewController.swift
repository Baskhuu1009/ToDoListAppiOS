//
//  RegisterViewController.swift
//  LadyBug
//
//  Created by baskhuu batpurev on 2019/06/02.
//  Copyright © 2019 Batpurev BASKHUU. All rights reserved.
//

import UIKit
import os.log
import RealmSwift

class RegisterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    @IBOutlet weak var userMail: UITextField!
    
    //下記変数はテストのため、作成したので今後削除すること
    @IBOutlet weak var testField: UITextField!
    
    @IBOutlet weak var processCondition: UIActivityIndicatorView!

    @IBAction func registerButton01(_ sender: UIButton) {
        let userNameField = userName.text
        let userPasswordField = userPassword.text
        let userMailField = userMail.text
        let realm = try! Realm()
        
        let userInfo = Users()
        
        userInfo.name = userNameField
        userInfo.password = userPasswordField
        userInfo.mail = userMailField
        
        try! realm.write{
            realm.add(userInfo)
        }
        //下記変数はテストのため、作成したので今後削除すること
        testField.text = userNameField
    }
}
