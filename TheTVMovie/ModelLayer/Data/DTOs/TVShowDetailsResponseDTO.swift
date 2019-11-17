//
//  MovieDetailsResponse.swift
//  TheTVMovie
//
//  Created by George Vardikos on 17/11/19.
//  Copyright © 2019 George Vardikos. All rights reserved.
//

import Foundation
import ObjectMapper

@objc public class TVShowDetailsResponse: NSObject, Mappable {
    @objc var backdropPath: String?
    @objc var showTitle: String?
    @objc var showSummary: String?
    @objc var genre: [Genre]?
    @objc var homepage: String?
    
    required public init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        backdropPath <- map["backdrop_path"]
        showTitle <- map["name"]
        showSummary <- map["overview"]
        genre <- map["genres"]
        homepage <- map["homepage"]
    }
}

@objc public class Genre: NSObject, Mappable {
    @objc var name: String?
    
    required public init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        name <- map["name"]
    }
}
