//
//  Request.swift
//  SharePlay
//
//  Created by Milosh Zelembaba on 2018-12-04.
//  Copyright © 2018 Milosh Zelembaba. All rights reserved.
//

import Foundation

class Request {
    var params: Dictionary<String, Any?>
    var url: String
    
    init() {
//        self.url = "http://10.0.0.15:8000/";
        self.url = "https://shareplay-204722.appspot.com/"
        self.params = Dictionary<String,Any?>.init()
        addParameter(key: "user", value: ApplicationUtil.instance.getUser())
    }
    
    func setUrl(url:String) {
        self.url += url
        if !url.hasSuffix("/") {
            self.url += "/"
        }
    }
    
    func addParameter(key:String, value:Any?) {
        if let tmp = value as? Serializable {
            self.params[key] = tmp.serialize()
        } else {
            self.params[key] = value
        }
    }
    
    func buildURL() -> String {
        return self.url
    }

    func serializeParams() -> String {
        return JsonUtil.jsonToString(dict: params)
    }
    
    func sendRequest(resultCallback: RequestCallback) {
        let url = URL(string: buildURL())!
        var request = URLRequest(url: url)
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        let postString = serializeParams()
        request.httpBody = postString.data(using: .utf8)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {                                                 // check for fundamental networking error
                print("error=\(error)")
                return
            }
            
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {           // check for http errors
                print("statusCode should be 200, but is \(httpStatus.statusCode)")
                print("response = \(response)")
            }
            
            let responseString = String(data: data, encoding: .utf8)
            resultCallback.onSuccess(result: self.toJson(jsonString: responseString!))
            print("responseString = \(responseString)")
        }
        task.resume()
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
}
