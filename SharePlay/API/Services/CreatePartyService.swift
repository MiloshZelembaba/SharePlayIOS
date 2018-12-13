//
//  CreatePartyService.swift
//  SharePlay
//
//  Created by Milosh Zelembaba on 2018-12-08.
//  Copyright © 2018 Milosh Zelembaba. All rights reserved.
//

import Foundation

class CreatePartyService {
    
    init(){}
    func requestService(partyName:String, requestCallback: RequestCallback) -> Void {
        let request: Request = Request.init()
        request.setUrl(url: "createParty/")
        request.addParameter(key: "party_name", value: partyName)
        request.sendRequest(resultCallback: requestCallback)
    }
}
