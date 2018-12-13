//
//  ApplicationUtil.swift
//  SharePlay
//
//  Created by Milosh Zelembaba on 2018-12-08.
//  Copyright © 2018 Milosh Zelembaba. All rights reserved.
//

import Foundation

class ApplicationUtil {
    static let instance: ApplicationUtil = ApplicationUtil.init()
    var user: User? = nil
    
    private init(){}
    
    public func setUser(user: User?) -> Void {
        self.user = user
    }
    
    public func getUser() -> User? {
        return self.user
    }
}
