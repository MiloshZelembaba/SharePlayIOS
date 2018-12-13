//
//  SendFCMTokenService.swift
//  SharePlay
//
//  Created by Milosh Zelembaba on 2018-12-08.
//  Copyright © 2018 Milosh Zelembaba. All rights reserved.
//

import Foundation

class SendFCMTokenService {
    
    init(){}
    func requestService(refreshToken: String, requestCallback: RequestCallback) -> Void {
        let request: Request = Request.init()
        request.setUrl(url: "updateFCMRefreshToken/")
        request.addParameter(key: "refresh_token", value: refreshToken)
        request.sendRequest(resultCallback: requestCallback)
    }
}
