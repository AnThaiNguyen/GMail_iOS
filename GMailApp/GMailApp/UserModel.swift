//
//  UserModel.swift
//  GMailApp
//
//  Created by Nguyen Thai An on 2/25/18.
//  Copyright © 2018 Nguyen Thai An. All rights reserved.
//

import Foundation

struct mailFromInList {
    var mID = ""
    var mThrID = ""
}

struct mailHeader {
    var number = ""
    var value = ""
}

class userInformation {
    let userId : String
    let emailAddress : String
    let name : String
    let givenName : String
    let familyName : String
    let hasImage : Bool
    var mailList : [mailFromInList]
    var mailHeaderList : [mailHeader]
    
    init(id : String, email : String, Ename : String,
         giveN : String, familyN : String, image : Bool) {
        userId = id
        emailAddress = email
        name = Ename
        givenName = giveN
        familyName = familyN
        hasImage = image
        mailList = [mailFromInList]()
        mailHeaderList = [mailHeader]()
    }
    
}
