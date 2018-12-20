//
//  FCMUtil.swift
//  SharePlay
//
//  Created by Milosh Zelembaba on 12/20/18.
//  Copyright © 2018 Milosh Zelembaba. All rights reserved.
//

import Foundation

class FCMUtil {
    static let instance: FCMUtil = FCMUtil.init()
    var fcmToken: String
    let sendFCMTokenService: SendFCMTokenService = SendFCMTokenService.init()
    
    private init(){
        fcmToken = ""
    }
    
    public func setToken(token:String) {
        fcmToken = token
        class tmp: RequestCallback{
            func onSuccess(result: Dictionary<String, Any?>) {
                print("SendFCMTokenService: successful")
            }
            func onFailure(errorMessage: String) {
                print("SendFCMTokenService: failed")
            }
        }
        let requestCallback: tmp = tmp.init()
        
        sendFCMTokenService.requestService(refreshToken: fcmToken, requestCallback: requestCallback)
    }
}
