//
//  CreateTemporaryUserService.swift
//  SharePlay
//
//  Created by Milosh Zelembaba on 2018-12-08.
//  Copyright © 2018 Milosh Zelembaba. All rights reserved.
//

import Foundation

class CreateTemporaryUserService {
    
    init(){}
    func requestService(email: String, displayName: String, product: String, requestCallback: RequestCallback) -> Void {
        let request: Request = Request.init()
        request.setUrl(url: "createTemporaryUser/")
        request.addParameter(key: "email", value: email)
        request.addParameter(key: "display_name", value: displayName)
        request.addParameter(key: "product", value: product)
        //        request.addParameter(key: "refresh_token", value: nil)  TODO: figure out the firebase refresh token shit
        request.sendRequest(resultCallback: requestCallback)
    }
}
