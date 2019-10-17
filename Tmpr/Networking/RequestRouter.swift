//
//  RequestRouter.swift
//
//
//  Created by Macbook on 10/30/17.
//  Copyright © 2017 DevPanther. All rights reserved.
//

import UIKit
import Alamofire

enum RequestResults: Error {
    case success
    case failed
    case requestError(message: String)
}
