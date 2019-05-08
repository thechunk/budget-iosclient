//
//  MainViewController.swift
//  iosclient
//
//  Created by Russell on 5/4/2019.
//  Copyright © 2019 Russell Cheung. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    let oauthSwift = OAuthManager.sharedManager.oauthSwift
    
    @IBOutlet weak var amountField: UITextField!
    @IBOutlet weak var descriptionField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func submitButton(_ sender: Any) {
        let data: [String : Any] = [
            "record": [
                "description": descriptionField.text ?? "",
                "amount": [
                    "currency": "HKD",
                    "value": Int(amountField.text ?? "0"),
                ],
                "paymentMethod": "credit",
                "category": "groceries"
            ]
        ]

        let _ = oauthSwift.client.post(
            "http://localhost:9000/api/budget/record",
            parameters: data,
            headers: ["Accept": "application/json", "Content-Type": "application/json"],
            success: { (response) in
                print(response.data)
            }, failure: { (error) in
                print(error.localizedDescription)
            }
        )
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
