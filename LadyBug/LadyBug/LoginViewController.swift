//
//  LoginViewController.swift
//  LadyBug
//
//  Created by baskhuu batpurev on 2019/06/02.
//  Copyright © 2019 Batpurev BASKHUU. All rights reserved.
//

import UIKit
import RealmSwift

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var loginName: UITextField!
    @IBOutlet weak var loginPassword: UITextField!
    
    @IBAction func loginButton(_ sender: UIButton) {
        let loginNameField = loginName.text
        let loginPasswordField = loginPassword.text
        
        let realm = try! Realm()
        
        let result = realm.objects(Users.self).filter("name = 'loginNameField'")
        print(result[0].name)
        
        if result.startIndex > 0 {
            
        }
    }

    override func didReceiveMemoryWarning(){
        super.didReceiveMemoryWarning()
    }
}
