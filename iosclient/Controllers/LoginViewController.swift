//
//  LoginViewController.swift
//  iosclient
//
//  Created by Russell on 26/3/2019.
//  Copyright © 2019 Russell Cheung. All rights reserved.
//

import UIKit
import OAuthSwift

class LoginViewController: UIViewController {
    
    @IBOutlet weak var loginButton: UIButton!
    let oauthSwift = OAuthManager.sharedManager
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTouchLoginButton(_ sender: Any) {
        oauthSwift.authorize(sender: self)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
