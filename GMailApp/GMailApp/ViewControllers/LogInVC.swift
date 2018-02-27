//
//  LogInVC
//  GMailApp
//
//  Created by Nguyen Thai An on 2/25/18.
//  Copyright © 2018 Nguyen Thai An. All rights reserved.
//

import UIKit
import GoogleAPIClientForREST
import GoogleSignIn

class LogInVC: UIViewController, GIDSignInUIDelegate, GIDSignInDelegate {
    
    @IBOutlet weak var signInBtn: GIDSignInButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().scopes = [kGTLRAuthScopeGmailReadonly]
    }
    
    /*
     Function: sign
     A function established by GIDSignInDelegate
     Return:
        Error
     GIDGoogleUser user: which comprises
                                        User ID, User Profile Data
     */
    
    // Function log in
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if error != nil {
            print("Error : \(error)")
        } else {
            print("Signing In Google is successed!  \(user)")
            DataManager.shared.setUser(user)
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let mailBoxVC = storyboard.instantiateViewController(withIdentifier: "MailBox") as! MailBoxVC
            self.present(mailBoxVC, animated: false, completion: nil)
        }
    }
}













