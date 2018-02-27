//
//  MailBoxVC.swift
//  GMailApp
//
//  Created by Nguyen Thai An on 2/25/18.
//  Copyright © 2018 Nguyen Thai An. All rights reserved.
//

import UIKit

class MailBoxVC: UIViewController {
    var userInfo : userInformation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("User's name : \(String(describing: userInfo?.mailHeaderList.count))")
    }
}
