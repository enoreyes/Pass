//
//  Pass.swift
//  Pass
//
//  Created by Eno Reyes on 11/5/17.
//  Copyright © 2017 Alex K. All rights reserved.
//

import Foundation

class Pass {
    
    var id: String?
    var senderUser: String?
    var recipientUser: String?
    var numGuests: Int?
    var transferrable: Bool?
    var reentry: Bool?
    var timestamp: Int?
    var message: String?
    var expirationDate: Int?
    
}

extension Pass {
    static func transform(dict: [String: Any], key: String) -> Pass {
        
        let pass = Pass()
        pass.id = key
        pass.senderUser = dict["senderUser"] as? String
        pass.recipientUser = dict["recipientUser"] as? String
        pass.numGuests = dict["numGuests"] as? Int
        pass.transferrable = dict["transferrable"] as? Bool
        pass.reentry = dict["reentry"] as? Bool
        pass.timestamp = dict["timestamp"] as? Int
        pass.message = dict["message"] as? String
        pass.expirationDate = dict["expirationDate"] as? Int
        
        return pass
    }
}

