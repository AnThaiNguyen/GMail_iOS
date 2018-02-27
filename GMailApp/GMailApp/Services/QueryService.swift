//
//  QueryService.swift
//  GMailApp
//
//  Created by Dao Duy Duong on 2/28/18.
//  Copyright © 2018 Nguyen Thai An. All rights reserved.
//

import Foundation
import GoogleAPIClientForREST

typealias FailureHandler = (Error) -> ()

protocol IQueryService {
    func getMailList(completionHandler: @escaping (([MailFromInList]) -> ()), failureHandler: FailureHandler?)
    
    func loadDetailMail(by mailID: String, completionHandler: @escaping (([MailHeader]) -> ()), failureHandler: FailureHandler?)
}

class QueryService: IQueryService {
    
    let dataManager = DataManager.shared
    
    func getMailList(completionHandler: @escaping (([MailFromInList]) -> ()), failureHandler: FailureHandler? = nil) {
        
        let query = GTLRGmailQuery_UsersMessagesList.query(withUserId: "me")
        dataManager.gmailService.executeQuery(query) { (ticker, object, error) in
            if let error = error {
                failureHandler?(error)
            }
            
            if let object = object as? GTLRGmail_ListMessagesResponse {
                let mailList = object.messages!.flatMap { MailFromInList(mID: $0.identifier!, mThrID: $0.threadId!) }
                completionHandler(mailList)
            } else {
                failureHandler?(NSError(domain: "com.gmailapp", code: 100, userInfo: [NSLocalizedDescriptionKey: "Cannot get data from Gmail"]))
            }
        }
        
    }
    
    func loadDetailMail(by mailID: String, completionHandler: @escaping (([MailHeader]) -> ()), failureHandler: FailureHandler? = nil) {
        
        let query = GTLRGmailQuery_UsersMessagesGet.query(withUserId: "me", identifier: mailID)
        dataManager.gmailService.executeQuery(query) { (ticker, object, error) in
            if let error = error {
                failureHandler?(error)
            }
            
            if let object = object as? GTLRGmail_Message,
                let payload = object.payload {
                let headers = payload.headers.flatMap { [MailHeader.parseHeader(String(describing: $0))] } ?? []
                completionHandler(headers)
            } else {
                failureHandler?(NSError(domain: "com.gmailapp", code: 101, userInfo: [NSLocalizedDescriptionKey: "Cannot load detail for mail \(mailID)"]))
            }
        }
        
    }
    
}




