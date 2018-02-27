//
//  UIKitExtensions.swift
//  GMailApp
//
//  Created by Dao Duy Duong on 2/28/18.
//  Copyright © 2018 Nguyen Thai An. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func presentAlert(withTitle title: String? = nil, message: String? = nil, okHandler: (() -> ())? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "ok", style: .default) { (_) in
            okHandler?()
        }
        alert.addAction(ok)
        
        self.present(alert, animated: true, completion: nil)
    }
    
}
