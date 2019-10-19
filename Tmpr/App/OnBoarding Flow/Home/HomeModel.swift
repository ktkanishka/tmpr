//
//  HomeModel.swift
//  Tmpr
//
//  Created by Kanishka Raveendra on 10/14/19.
//  Copyright © 2019 Kanishka Raveendra. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import AlamofireObjectMapper
import SwiftyJSON

class HomeModel : Mappable {
    
    var title: String?
    var id: Int?
    var key: String?
    var open_time: String?
    var end_time: String?
    var status: String?
    var price: String?
    var currency: String?
    var distance: String?
    var photo_url: String?
    
    func mapping(map: Map) {
        title <- map["title"]
        id <- map["id"]
        key <- map["key"]
        open_time <- map["shifts.0.start_time"]
        end_time <- map["shifts.0.end_time"]
        status <- map["status"]
        price <- map["shifts.0.earnings_per_hour"]
        currency <- map["shifts.0.currency"]
        distance <- map["distance"]
        photo_url <- map["photo"]
    }
    
    required init?(map: Map) {
        title = ""
        id = 0
        key = ""
        open_time = ""
        end_time = ""
        status = ""
        price = ""
        currency = ""
        distance = ""
        photo_url = ""
    }
    
    //MARK : GET HOMEFEED LIST
    static func getHomeFeed (completion: @escaping (_ error: RequestResults, _ result: Any) -> Void) {
        
        //dates are hardcoded
        let baseURL = String(format: "%@/%@%@", APPURL.Domains.Dev, APPURL.PATH, "2019-10-16,2019-10-17,2019-10-18,2019-10-19")
        
        //print("Rest Domain: \(baseURL)")
        
        if let url = URL(string: baseURL) {
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = HTTPMethod.get.rawValue
            
            urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            Alamofire.request(urlRequest).responseJSON { (response: DataResponse<Any>) in
                switch response.result {
                case .success:
                    guard let responseJSON = response.result.value as? [String: Any] else { return }
                    if let mResponse = responseJSON["data"] {
                        if let dicArray = Mapper<HomeModel>()
                            .mapDictionaryOfArrays(JSONObject: mResponse) {                            
                            completion(RequestResults.success, dicArray)
                        }
                    } else {
                        completion(RequestResults.failed, [])
                    }
                    
                    break
                    
                case .failure(let error):
                    completion(RequestResults.requestError(message: error.localizedDescription), error)
                    print("REQUEST FAILED: \(error)")
                    break
                }
            }
        }
    }
}


