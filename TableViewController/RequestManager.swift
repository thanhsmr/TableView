//
//  RequestManager.swift
//  TableViewController
//
//  Created by SMR on 8/28/17.
//  Copyright © 2017 Thanh Bui. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

class RequestManager: NSObject {
    
    // Can't init is singleton
    private override init()
    {
        
    }
    
    // MARK: Shared Instance
    
    static let shared = RequestManager()
    
    fileprivate lazy var headerDefault: [String : String] = {
        var header = [String : String]()
        header["user"] = "abc"
        header["password"] = "xyz"
        return header
    }()
    
    public func getArticleNew(urlString : String, page : Int, num : Int, completion : @escaping ([Article]?,Bool) -> Void) ->  Void {
        let urlFull = String.init(format: "%@/%d/%d", urlString, page, num)
        Alamofire.request(urlFull, method: .get, parameters: [:], encoding: JSONEncoding.default, headers: headerDefault).responseArray { (response : DataResponse<[Article]>) in
            if (response.error != nil) {
                completion(nil, false)
            } else {
                completion(response.result.value, true)
            }
        }
    }
    
    

}
