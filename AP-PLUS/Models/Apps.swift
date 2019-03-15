//
//  Apps.swift
//  AP-PLUS
//
//  Created by  nf on 15/03/2019.
//

import Foundation
import ObjectMapper

class AppModel : NSObject , Mappable

{
    var appsObject : [AppsObject]?
    
    required init?(map:Map)
    {
        
    }
    
    func mapping(map:Map)
    {
        appsObject <- map["Apps"]
    }
}

class AppsObject: NSObject, Mappable {
    //  static let sharedInstance = AppsObject()
    var url: String?
    var app_name : String?
    var image : String?

    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        url <- map["url"]
        app_name <- map["name"]
        image <- map["image"]

    }
}
