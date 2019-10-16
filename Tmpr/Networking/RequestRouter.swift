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

public enum RequestRouter: URLRequestConvertible {
    static let authenticationToken = "Basic xxx"
    
    case login(parameters: Parameters)
    case tags(String)
    case colors(String)
    
    //Method Types
    var method: HTTPMethod {
        switch self {
        case .login:
            return .post
        case .tags, .colors:
            return .get
        }
    }
    
    //api Paths
    var path: String {
        switch self {
        case .login:
            return "user/customer_login"
        case .tags:
            return "/tagging"
        case .colors:
            return "/colors"
        }
    }
    //"email": "customer.i4t@gmail.com","password": "customer@123","type": 1
    public func asURLRequest() throws -> URLRequest {
        let parameters: [String: Any] = {
            switch self {
            case .login(let parameters):
                return parameters
            case .colors(let contentID):
                return ["content": contentID, "extract_object_colors": 0]
            default:
                return [:]
            }
        }()
        
        let url = try AppURLs.Domains.liveURL.asURL()
        
        var request = URLRequest(url: url.appendingPathComponent(path))
        request.httpMethod = method.rawValue
        
//        request.setValue(RequestRouter.authenticationToken, forHTTPHeaderField: "Authorization")
        request.timeoutInterval = TimeInterval(10 * 1000)
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        return try JSONEncoding.default.encode(request, with: parameters)
//        return try URLEncoding.default.encode(request, with: parameters)
    }
}
