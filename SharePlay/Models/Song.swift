//
//  Song.swift
//  SharePlay
//
//  Created by Milosh Zelembaba on 2018-12-03.
//  Copyright © 2018 Milosh Zelembaba. All rights reserved.
//

import Foundation

class Song: Serializable {
    var id:String
    var spotifyURI:String
    var songName:String
    var artists:String
    var imageUrl:String
//    private Bitmap mImage;
    var voteCount:Int
    var isCurrentlyPlaying:Bool
    var isBeingSwiped:Bool
    
    init(spotifyURI: String?, songName: String?, artists: String?, imageUrl: String?) {
        self.id = ""
        self.spotifyURI = spotifyURI!;
        self.songName = songName!;
        self.artists = artists!;
        self.imageUrl = imageUrl!;
        self.voteCount = 1;
        self.isCurrentlyPlaying = false;
        self.isBeingSwiped = false;
    }
    
    convenience init(jsonString: String) throws {
        self.init(spotifyURI:"", songName:"", artists:"", imageUrl:"")
        let json = toJson(jsonString:jsonString)
        
        if json["id"] == nil || json["song_name"] == nil || json["artists"] == nil || json["image_url"] == nil || json["uri"] == nil || json["vote_count"] == nil{
            throw NSError.init()
        }
        
        self.id = json["id"]! as! String
        self.spotifyURI = json["uri"]! as! String
        self.songName = json["song_name"]! as! String
        self.artists = json["artists"]! as! String
        self.imageUrl = json["image_url"]! as! String
        self.voteCount = json["vote_count"]! as! Int
    }
    
    override func serialize() -> Dictionary<String, String> {
        var json: Dictionary<String,String> = Dictionary.init()
        
        json["id"] = id
        json["uri"] = spotifyURI
        json["song_name"] = songName
        json["artists"] = artists
        json["image_url"] = imageUrl
        json["vote_count"] = String(voteCount)
        
        return json
    }
}
