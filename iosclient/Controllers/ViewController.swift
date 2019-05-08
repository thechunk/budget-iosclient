//
//  ViewController.swift
//  iosclient
//
//  Created by Russell on 26/3/2019.
//  Copyright © 2019 Russell Cheung. All rights reserved.
//

import UIKit

class ViewController: UIViewController, OAuthManagerDelegate {
    
    let oauthSwift = OAuthManager.sharedManager.oauthSwift

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        OAuthManager.sharedManager.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        oauthSwift.renewAccessToken(withRefreshToken: OAuthManager.sharedManager.refreshToken, success: { (credentials, _, _) in
            print(credentials.oauthToken)
        }) { (error) in
            print(error)
        }
        oauthSwift.client.get("http://localhost:8080/me", success: { (response) in
            print(response)
        }) { (error) in
            print(error)
        }

        if (OAuthManager.sharedManager.accessToken.isEmpty) {
            performSegue(withIdentifier: "AppToLogin", sender: nil)
        } else {
            performSegue(withIdentifier: "AppToMain", sender: nil)
        }
    }

    func authorizeDidComplete() {
        navigationController?.dismiss(animated: true, completion: nil)
    }

}
