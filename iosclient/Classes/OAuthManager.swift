//
//  OAuthManager.swift
//  iosclient
//
//  Created by Russell on 27/3/2019.
//  Copyright © 2019 Russell Cheung. All rights reserved.
//

import UIKit
import OAuthSwift

protocol OAuthManagerDelegate: class {
    func authorizeDidComplete()
}

class OAuthManager: NSObject {
    static let sharedManager = OAuthManager()
    let oauthSwift = OAuth2Swift(
        consumerKey: "clientId",
        consumerSecret: "",
        authorizeUrl: "http://localhost:8080/oauth/authorize",
        accessTokenUrl: "http://localhost:8080/oauth/token_proxy",
        responseType: "code",
        contentType: "application/x-www-form-urlencoded"
    )
    var accessToken: String = ""
    var refreshToken: String = ""
    weak var delegate: OAuthManagerDelegate?
    
    private override init() {
        super.init()
        oauthSwift.allowMissingStateCheck = true
    }
    
    func authorize(sender: UIViewController) {
        oauthSwift.authorizeURLHandler = SafariURLHandler(viewController: sender, oauthSwift: oauthSwift)
        oauthSwift.authorize(
            withCallbackURL: URL(string: "rcbudget://oauth")!,
            scope: "read+user_info",
            state: "",
            success: { credential, response, parameters in
                // TODO: store to persistent
                OAuthManager.sharedManager.accessToken = credential.oauthToken
                OAuthManager.sharedManager.refreshToken = credential.oauthRefreshToken
                self.delegate?.authorizeDidComplete()
            }, failure: {
                error in print(error.localizedDescription)
            }
        )
    }
}
