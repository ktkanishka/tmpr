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

//public func dataFromFileServer(_ filename: String) -> Data? {
//    @objc class TestClass: NSObject { }
//
//    let bundle = Bundle(for: TestClass.self)
//    if let path = bundle.path(forResource: filename, ofType: "json") {
//        return (try? Data(contentsOf: URL(fileURLWithPath: path)))
//    }
//    return nil
//}

class HomeItemModel: Mappable {
    var title: String?
    var id: Int?
    var key: String?
    var open_time: String?
    var status: String?
    var price: String?
    var distance: String?
    var photo_url: String?
    
    func mapping(map: Map) {
        title <- map["title"]
        id <- map["id"]
        key <- map["key"]
        open_time <- map["open_time"]
        status <- map["status"]
        price <- map["price"]
        distance <- map["distance"]
        photo_url <- map["photo_url"]
    }
    
    required init?(map: Map) {
        title = ""
        id = 0
        key = ""
        open_time = ""
        status = ""
        price = ""
        distance = ""
        photo_url = ""
    }
}

class HomeModel: Mappable {
    var data: [HomeItemModel]?
    
    func mapping(map: Map) {
        data <- map["data"]
    }
    
    required init?(map: Map) {
        data = []
    }
    
    //MARK : GET HomeFEED LIST
    static func getHomeFeed (completion: @escaping (_ error: RequestResults, _ result: Any) -> Void) {
        
        let baseURL = String(format: "%@/%@/%@", APPURL.Domains.Dev, APPURL.PATH, APPURL.FETCH_HOME_FEED_ID)
        print("Rest Domain: \(baseURL)")
        
        if let url = URL(string: baseURL) {
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = HTTPMethod.get.rawValue
            
            urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            Alamofire.request(urlRequest).responseJSON { (response: DataResponse<Any>) in
                switch response.result {
                case .success:
                    
                    //print("Request: \(String(describing: response.request))")   // original url request
                    //print("Response: \(String(describing: response.response))") // http url response
                    //print("Result: \(response)")
                    
                    let listArray = NSMutableArray()
                    guard let responseJSON = response.result.value as? [String: Any] else { return }
                    if let mResponse = responseJSON["data"] {
                        let itemsArray = mResponse as! NSArray
                        for object in itemsArray {
                            //print("HomeItemModelModel Object :\(object)")
                            let tsk = Mapper<HomeItemModel>().map(JSONObject: object)
                            listArray.add(tsk!)
                        }
                        completion(RequestResults.success, listArray)

                    } else {
                        completion(RequestResults.failed, listArray)
                    }
                    
                    break
                    
                case .failure(let error):
                    completion(RequestResults.requestError(message: error.localizedDescription), error)
                    print("REQUEST FAILED: \(error)")
                    print("REQUEST FAILED: \(error.localizedDescription)")
                    break
                }
            }
        }
    }
}


