//
//  ResultCallback.swift
//  SharePlay
//
//  Created by Milosh Zelembaba on 2018-12-08.
//  Copyright © 2018 Milosh Zelembaba. All rights reserved.
//

import Foundation

protocol RequestCallback {
    func onSuccess(result: Dictionary<String, Any?>) -> Void
    func onFailure(errorMessage: String) -> Void
}
