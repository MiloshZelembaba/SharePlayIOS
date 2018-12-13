//
//  JoinPartyService.swift
//  SharePlay
//
//  Created by Milosh Zelembaba on 2018-12-08.
//  Copyright © 2018 Milosh Zelembaba. All rights reserved.
//

import Foundation

class JoinPartyService {
    
    init(){}
    func requestService(partyId: String, user: User, requestCallback: RequestCallback) -> Void {
        let request: Request = Request.init()
        request.setUrl(url: "joinParty/")
        request.addParameter(key: "party_id", value: partyId)
        request.addParameter(key: "user", value: user)
        request.sendRequest(resultCallback: requestCallback)
    }
}
