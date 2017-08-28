//
//  Article.swift
//  TableViewController
//
//  Created by SMR on 8/28/17.
//  Copyright © 2017 Thanh Bui. All rights reserved.
//

import UIKit
import ObjectMapper

class Article: Mappable {
    var location: String?
    var threeDayForecast: [Int]?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        location <- map["location"]
        threeDayForecast <- map["three_day_forecast"]
    }

}
