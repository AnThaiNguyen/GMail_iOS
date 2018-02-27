//
//  DataManager.swift
//  GMailApp
//
//  Created by Dao Duy Duong on 2/28/18.
//  Copyright © 2018 Nguyen Thai An. All rights reserved.
//

import Foundation
import GoogleAPIClientForREST

class DataManager {
    
    // instance access
    static let shared: DataManager = DataManager()
    
    // service for gmail queries
    let gmailService = GTLRGmailService()
    
    // keep user after login successfully
    var user: UserInformation!
    
    func setUser(_ gUser: GIDGoogleUser) {
        gmailService.authorizer = gUser.authentication.fetcherAuthorizer()
        
        user = UserInformation(id: gUser.userID, email: gUser.profile.email, Ename: gUser.profile.name, giveN: gUser.profile.givenName, familyN: gUser.profile.familyName, image: gUser.profile.hasImage)
    }
    
}
