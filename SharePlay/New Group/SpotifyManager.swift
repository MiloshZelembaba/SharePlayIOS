//
//  File.swift
//  SharePlay
//
//  Created by Milosh Zelembaba on 12/19/18.
//  Copyright © 2018 Milosh Zelembaba. All rights reserved.
//

import Foundation

class SpotifyManager {
    static let instance: SpotifyManager = SpotifyManager.init()
    let attemptLoginService: AttemptLoginService = AttemptLoginService.init()
    
    private init(){}
    
    public func authorize() {
        let user: User? = ApplicationUtil.instance.getUser()
        var email: String = ""
        var product: String = ""
        if user != nil {
            email = user!.email
            product = user!.product
        }
        let requestCallback: tmp = tmp.init()
        attemptLoginService.requestService(email: email, product: product, requestCallback: requestCallback)
    }
}

class tmp: RequestCallback{
    func onSuccess(result: Dictionary<String, Any?>) {
        
    }
    func onFailure(errorMessage: String) {
        print("AttemptLoginService: failed")
    }
}
