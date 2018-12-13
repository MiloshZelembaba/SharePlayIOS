//
//  Serializable.swift
//  SharePlay
//
//  Created by Milosh Zelembaba on 2018-12-03.
//  Copyright © 2018 Milosh Zelembaba. All rights reserved.
//

import Foundation

// man WTF swift, lemme make this an extension instead of a class

class Serializable {
    // must override
    func serialize() -> Dictionary<String,String> {
        let tmp:Dictionary<String,String> = Dictionary.init()
        return tmp
    }
    
    func toJson(jsonString: String) -> Dictionary<String,Any?> {
        let data = jsonString.data(using: .utf8)!

        do {
            if let jsonArray = try JSONSerialization.jsonObject(with: data, options : .allowFragments) as? Dictionary<String,Any?>
            {
                return jsonArray
            } else {
                print("bad json")
            }
        } catch let error as NSError {
            print(error)
        }

        let tmp:Dictionary<String,Any?> = Dictionary.init()
        return tmp
    }
    
    func toJsonArray(jsonString: String) -> [Dictionary<String,Any?>] {
        let data = jsonString.data(using: .utf8)!
        
        do {
            if let jsonArray = try JSONSerialization.jsonObject(with: data, options : .allowFragments) as? [Dictionary<String,Any?>]
            {
                return jsonArray
            } else {
                print("bad json")
            }
        } catch let error as NSError {
            print(error)
        }
        
        let tmp:[Dictionary<String,Any?>] = [Dictionary.init()]
        return tmp
    }
}
