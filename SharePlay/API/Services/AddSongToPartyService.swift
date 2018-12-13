//
//  AddSongToPartyService.swift
//  SharePlay
//
//  Created by Milosh Zelembaba on 2018-12-08.
//  Copyright © 2018 Milosh Zelembaba. All rights reserved.
//

import Foundation

class AddSongToPartyService {
    
    init(){}
    func requestService(party: Party, songs: Array<Song>, requestCallback: RequestCallback) -> Void {
        let request: Request = Request.init()
        request.setUrl(url: "addSongToParty/")
        request.addParameter(key: "party", value: party)
        request.addParameter(key: "songs", value: JsonUtil.serializableArrayToJsonArray(array: songs))
        request.sendRequest(resultCallback: requestCallback)
    }
}
