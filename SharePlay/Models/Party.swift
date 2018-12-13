//
//  Party.swift
//  SharePlay
//
//  Created by Milosh Zelembaba on 2018-12-03.
//  Copyright © 2018 Milosh Zelembaba. All rights reserved.
//

import Foundation

class Party: Serializable {
    var id: String
    var partyName: String
    var host: User?
    var songs: Array<Song>
    var partyMembers: Array<User>
    var currentlyPlaying: Song?
    
    override init() {
        self.id = ""
        self.partyName = ""
        self.host = nil
        self.songs = Array.init()
        self.partyMembers = Array.init()
        self.currentlyPlaying = nil
    }
    
    convenience init(jsonString: String) throws {
        self.init()
        let json = toJson(jsonString:jsonString)
        
        if json["id"] == nil || json["party_name"] == nil || json["host"] == nil || json["party_members"] == nil || json["songs"] == nil || json["current_song_uri"] == nil{
            throw NSError.init()
        }
        
        id = json["id"]!! as! String
        partyName = json["party_name"]!! as! String
        do {
            host = try User.init(jsonString: json["host"]!! as! String)
            currentlyPlaying = try Song.init(jsonString: json["current_song_uri"]!! as! String)
        } catch let error as NSError {
            throw error
        }
        
        if json["songs"] != nil {
            
        }
        if json["party_members"] != nil {
            addPartyMembers(jsonArray: json["party_members"]!! as! String)
        }
    }
    
    func addPartyMembers(jsonArray: String) -> Void {
        
    }
    
    override func serialize() -> Dictionary<String, String> {
        var json: Dictionary<String,String> = Dictionary.init()
        
        json["id"] = String(id)
        json["party_name"] = partyName
        json["host"] = JsonUtil.jsonToString(dict: host!.serialize())
        json["party_members"] = JsonUtil.serializableArrayToJsonArray(array: partyMembers)
        
        return json
    }
}
