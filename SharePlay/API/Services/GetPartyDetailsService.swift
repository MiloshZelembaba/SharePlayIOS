//
//  GetPartyDetailsService.swift
//  SharePlay
//
//  Created by Milosh Zelembaba on 2018-12-08.
//  Copyright © 2018 Milosh Zelembaba. All rights reserved.
//

import Foundation

class GetPartyDetailsService {
    
    init(){}
    func requestService(partyId: String, requestCallback: RequestCallback) -> Void {
        let request: Request = Request.init()
        request.setUrl(url: "getPartyDetails/")
        request.addParameter(key: "party_id", value: partyId)
        request.sendRequest(resultCallback: requestCallback)
    }
}
