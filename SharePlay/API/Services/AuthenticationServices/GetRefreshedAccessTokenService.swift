//
//  GetRefreshedAccessTokenService.swift
//  SharePlay
//
//  Created by Milosh Zelembaba on 2018-12-08.
//  Copyright © 2018 Milosh Zelembaba. All rights reserved.
//

import Foundation

class GetRefreshedAccessTokenService {
    
    init(){}
    func requestService(email: String, requestCallback: RequestCallback) -> Void {
        let request: Request = Request.init()
        request.setUrl(url: "refreshAccessToken/")
        request.addParameter(key: "email", value: email) // todo: figure out the firebase_refresh_token
        request.sendRequest(resultCallback: requestCallback)
    }
}
