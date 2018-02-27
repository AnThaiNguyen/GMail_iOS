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
    
    var user_Infor : userInformation?
    let gmailService = GTLRGmailService()
    private let scopes = [kGTLRAuthScopeGmailReadonly]
    @IBOutlet weak var signInBtn: GIDSignInButton!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().scopes = self.scopes
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
            self.gmailService.authorizer = user.authentication.fetcherAuthorizer()
            user_Infor = userInformation(id: user.userID, email: user.profile.email,
                                               Ename: user.profile.name, giveN: user.profile.givenName,
                                               familyN: user.profile.familyName, image: user.profile.hasImage)
            // Request query to get mail list
            // Nil data
            self.requestGetMailListFromGoogle((user_Infor?.userId)!)
            
            // Navigate to MailBoxVC and use the user's data to load into a tableview created in the MailBoxVC
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let mailBoxVC = storyboard.instantiateViewController(withIdentifier: "MailBox") as! MailBoxVC
            mailBoxVC.userInfo = self.user_Infor
            self.present(mailBoxVC, animated: false, completion: nil)
        }
    }
    
    
    /*
     Function: requestGetMailListFromGoogle
     Para:
        String uID (which is user ID returned by GoogleSignIn)
     Works:
        Create a query to get the user's mail list
        Execute the query and then execute the function, getMailList
     Note:
     Return values form (Mail List) : [{mail ID, thread ID}]
     */
    func requestGetMailListFromGoogle(_ uID: String){
        let query = GTLRGmailQuery_UsersMessagesList.query(withUserId: "me")
        self.gmailService.executeQuery(query,
                                       delegate: self,
                                       didFinish: #selector(self.getMailList(ticket:finishedWithObject:error:)))
        
    }
    
    /*
     Function: getMailList
     Para:
        GTLRGmailService Ticket is like a key for access to the Gmail service
        GTLRGmail_ListMessagesResponse messagesRespone is the list of emails
        NSError error is to return a error from the service if it happens
     Works:
        Process the response from the Gmail service and parse that mail list into the variable user_Info
        From the mail list, get each mail ID and request to the service to get that mail data
     Note:
        With Gmail, the service doesn't send back all email data, the dev has to send query to request a mail detail through using its mail ID
     */
    @objc func getMailList(ticket: GTLRGmailService,
                     finishedWithObject messagesResponse : GTLRGmail_ListMessagesResponse,
                     error: NSError!){
        if let error = error {
            showAlert(title: "Error", message: error.localizedDescription)
        } else {
            let mailList = messagesResponse.messages!
            for mail in mailList {
                // Stored user mail list given by the service
                // Mail list formed that each mail has its idenfifier and threadID
                let temple = mailFromInList(mID: mail.identifier!, mThrID: mail.threadId!)
                self.user_Infor?.mailList.append(temple)
            }
        }
        
        // A loop to send query to the service for each mail
        for item in (self.user_Infor?.mailList)! {
            getOneEmail_FromMailBox(item.mID)
        }
    }
    
    /*
     Function: getOneEmail_FromMailBox
     */
    func getOneEmail_FromMailBox(_ mailID: String){
        let query = GTLRGmailQuery_UsersMessagesGet.query(withUserId: "me", identifier: mailID)
        gmailService.executeQuery(query,
                                  delegate: self,
                                  didFinish: #selector(self.parsingMailData(ticket:finishedWithObject:error:)))
    }
    
    /*
     Function: getOneEmail_FromMailBox
     Work:
        Get mailResponse's headers in its payload
        Spread all header to get the header's name and value
     */
    @objc func parsingMailData(ticket : GTLRServiceTicket,
                               finishedWithObject mailResponse : GTLRGmail_Message,
                               error : NSError?){
        if let error = error {
            showAlert(title: "Error", message: error.localizedDescription)
        } else {
            DispatchQueue.global(qos: .userInitiated).async {
                let reviceMail = mailResponse.payload?.headers
                for header in reviceMail! {
                    self.parserMailHeaders(header: String(describing: header))
                }
            }
        }
    }
    
    /*
     Function: parserMailHeaders
     Work:
        Get value of both tag<name> and <value> in the header string
     */
    func parserMailHeaders(header: String) -> (name:String, value:String){
        var data = String(header[header.index(of: "{")!..<header.index(of: "}")!])
        // Remove special characters
        data = data.replacingOccurrences(of: "\"", with: "")
        
        // name part
        let nameGroup = String(data[data.index(of: "name:")!..<data.index(of: "value:")!])
        let x = nameGroup.index(of: ":")
        let name = String(nameGroup[nameGroup.index(after: x!)..<nameGroup.endIndex])
        
        // value part
        let valueGroup = String(data[data.index(of: "value:")!..<data.endIndex])
        let y = valueGroup.index(of: ":")
        let value = String(valueGroup[valueGroup.index(after: y!)..<valueGroup.endIndex])
        
        print("Name = \(name), Value = \(value)")
        return (name, value)
    }
    
    /*
     Function: showAlert
     Work:
        Get error string returned by the google service and present it as a alert
     */
    func showAlert(title : String, message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: UIAlertControllerStyle.alert
        )
        let ok = UIAlertAction(
            title: "OK",
            style: UIAlertActionStyle.default,
            handler: nil
        )
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
    }
}

extension String {
    func index(of string: String, options: CompareOptions = .literal) -> Index? {
        return range(of: string, options: options)?.lowerBound
    }
}
