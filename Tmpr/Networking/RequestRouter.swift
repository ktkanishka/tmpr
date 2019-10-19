//
//  RequestRouter.swift
//  Tmpr
//
//  Created by Kanishka Raveendra on 10/16/19.
//  Copyright © 2019 Kanishka Raveendra. All rights reserved.
//

import UIKit
import Alamofire

enum RequestResults: Error {
    case success
    case failed
    case requestError(message: String)
}
