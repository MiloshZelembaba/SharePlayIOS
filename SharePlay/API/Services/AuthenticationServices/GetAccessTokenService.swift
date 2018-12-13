//
//  GetAccessTokenService.swift
//  SharePlay
//
//  Created by Milosh Zelembaba on 2018-12-08.
//  Copyright © 2018 Milosh Zelembaba. All rights reserved.
//

import Foundation

class GetAccessTokenService {
    
    init(){}
    func requestService(authCode: String, requestCallback: RequestCallback) -> Void {
        let request: Request = Request.init()
        request.setUrl(url: "getAccessToken/")
        request.addParameter(key: "auth_code", value: authCode)
        request.addParameter(key: "firebase_refresh_token", value: nil) // todo: figure out the firebase_refresh_token
        request.sendRequest(resultCallback: requestCallback)
    }
}
