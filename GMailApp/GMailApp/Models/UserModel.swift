//
//  UserModel.swift
//  GMailApp
//
//  Created by Nguyen Thai An on 2/25/18.
//  Copyright © 2018 Nguyen Thai An. All rights reserved.
//

import Foundation

struct MailFromInList {
    let mID: String
    let mThrID: String
}

struct MailHeader {
    let name: String
    let value: String
    
    static func parseHeader(_ header: String) -> MailHeader {
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
        
        return MailHeader(name: name, value: value)
    }
}

class UserInformation {
    let userId : String
    let emailAddress : String
    let name : String
    let givenName : String
    let familyName : String
    let hasImage : Bool
    
    var mailList : [MailFromInList]
    var mailHeaderList : [MailHeader]
    
    init(id : String, email : String, Ename : String, giveN : String, familyN : String, image : Bool) {
        userId = id
        emailAddress = email
        name = Ename
        givenName = giveN
        familyName = familyN
        hasImage = image
        mailList = [MailFromInList]()
        mailHeaderList = [MailHeader]()
    }
    
}
