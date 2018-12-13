//
//  IncrementSongVoteCountService.swift
//  SharePlay
//
//  Created by Milosh Zelembaba on 2018-12-08.
//  Copyright © 2018 Milosh Zelembaba. All rights reserved.
//

import Foundation

class IncrementSongVoteCountService {
    
    init(){}
    func requestService(song: Song, requestCallback: RequestCallback) -> Void {
        let request: Request = Request.init()
        request.setUrl(url: "incrementSongVoteCount/")
        request.addParameter(key: "song", value: song)
        request.sendRequest(resultCallback: requestCallback)
    }
}
