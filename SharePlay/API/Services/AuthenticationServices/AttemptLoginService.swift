//
//  AttemptLoginService.swift
//  SharePlay
//
//  Created by Milosh Zelembaba on 2018-12-08.
//  Copyright © 2018 Milosh Zelembaba. All rights reserved.
//

import Foundation

class AttemptLoginService {

    init(){}
    func requestService(email: String, product: String, requestCallback: RequestCallback) -> Void {
        let request: Request = Request.init()
        request.setUrl(url: "attemptLogin/")
        request.addParameter(key: "email", value: email)
        request.addParameter(key: "product", value: product)
        request.addParameter(key: "firebase_refresh_token", value:FCMUtil.instance.fcmToken)
        request.sendRequest(resultCallback: requestCallback)
    }
}
