//
//  jsonUtil.swift
//  SharePlay
//
//  Created by Milosh Zelembaba on 2018-12-08.
//  Copyright © 2018 Milosh Zelembaba. All rights reserved.
//

import Foundation

class JsonUtil {
    static func jsonToString(dict: Dictionary<String, Any?>) -> String {
        do {
            let data1 =  try JSONSerialization.data(withJSONObject: dict, options: JSONSerialization.WritingOptions.prettyPrinted) // first of all convert json to the data
            let convertedString = String(data: data1, encoding: String.Encoding.utf8) // the data will be converted to the string
            return convertedString ?? "defaultvalue"
        } catch let myJSONError {
            print(myJSONError)
        }
        
        return ""
    }
    
    static func serializableArrayToJsonArray(array:Array<Serializable>) -> String {
        var jsonArray:String = "["
        for element in array{
            jsonArray += JsonUtil.jsonToString(dict: element.serialize()) + ","
        }
        if jsonArray.hasSuffix(",") {
            jsonArray.removeLast()
        }
        jsonArray += "]"
        
        return jsonArray
    }
}
