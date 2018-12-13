//
//  File.swift
//  SharePlay
//
//  Created by Milosh Zelembaba on 2018-12-03.
//  Copyright © 2018 Milosh Zelembaba. All rights reserved.
//

import Foundation

class User: Serializable {
    var id: String
    var firstName: String
    var lastName: String
    var email: String
    var displayName: String
    var product: String
    
    init(id: String?, fn: String?, ln: String?, email: String?, dn: String?, p: String?) {
        self.id = id!
        self.firstName = fn!
        self.lastName = ln!
        self.email = email!
        self.displayName = dn!
        self.product = p!
    }
    
    convenience init(jsonString: String) throws {
        self.init(id:"", fn:"", ln:"", email:"", dn:"", p:"")
        let json = toJson(jsonString:jsonString)
        
        if json["id"] == nil || json["first_name"] == nil || json["last_name"] == nil || json["email"] == nil || json["display_name"] == nil || json["product"] == nil{
            throw NSError.init()
        }
        
        id = json["id"]! as! String
        firstName = json["first_name"]! as! String
        lastName = json["last_name"]! as! String
        email = json["email"]! as! String
        displayName = json["display_name"]! as! String
        product = json["product"]! as! String
    }
    
    override func serialize() -> Dictionary<String, String> {
        var json: Dictionary<String,String> = Dictionary.init()
        
        json["id"] = id
        json["first_name"] = firstName
        json["last_name"] = lastName
        json["email"] = email
        json["display_name"] = displayName
        json["product"] = product
        
        return json
    }
}



