//
//  MailBoxVC.swift
//  GMailApp
//
//  Created by Nguyen Thai An on 2/25/18.
//  Copyright © 2018 Nguyen Thai An. All rights reserved.
//

import UIKit
import GoogleAPIClientForREST

class MailBoxVC: UIViewController {
    
    let dataManager = DataManager.shared
    let queryService: IQueryService = QueryService()
    
    var count = -1
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // get the mail list and render them
        queryService.getMailList(completionHandler: OnGetMailList) { (error) in
            print(error.localizedDescription)
            self.presentAlert(withTitle: "Error", message: error.localizedDescription)
        }
    }
    
    private func OnGetMailList(_ mailList: [MailFromInList]) {
        dataManager.user.mailList = mailList
        
        // start loading headers
        loadHeader(completionHandler: allHeadersLoaded)
    }
    
    private func allHeadersLoaded() {
        
    }
    
    private func loadHeader(completionHandler: @escaping (() -> ())) {
        count += 1
        if count >= dataManager.user.mailList.count {
            completionHandler()
        } else {
            let mail = dataManager.user.mailList[count]
            queryService.loadDetailMail(by: mail.mID, completionHandler: { (mailHeaders) in
                // store mail headers
                
                // load next mail
                self.loadHeader(completionHandler: completionHandler)
            }, failureHandler: { (error) in
                print(error.localizedDescription)
            })
        }
    }
    
}














