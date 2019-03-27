//
//  ViewController.swift
//  iosclient
//
//  Created by Russell on 26/3/2019.
//  Copyright © 2019 Russell Cheung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let oauthSwift = OAuthManager.sharedManager.oauthSwift

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        performSegue(withIdentifier: "AppToLogin", sender: nil)
        oauthSwift.renewAccessToken(withRefreshToken: OAuthManager.sharedManager.refreshToken, success: { (credentials, _, _) in
            print(credentials.oauthToken)
        }) { (error) in
            print(error.localizedDescription)
        }
    }


}

