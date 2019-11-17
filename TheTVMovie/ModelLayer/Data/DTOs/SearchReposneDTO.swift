//
//  ShowDTO.swift
//  TheTVMovie
//
//  Created by George Vardikos on 16/11/19.
//  Copyright © 2019 George Vardikos. All rights reserved.
//

import Foundation
import ObjectMapper

public struct SearchReposne: Mappable {
    var page: Int?
    var totalResults: Int?
    var totalPages: Int?
    var results: [Results]?
    
    public init?(map: Map) {
        
    }
    
    mutating public func mapping(map: Map) {
        page <- map["page"]
        totalResults <- map["total_results"]
        totalPages <- map["total_pages"]
        results <- map["results"]
    }
}

public struct Results: Mappable {
    var originalName: String?
    var originalTitle: String?
    var voteAverage: Double?
    var firstAirDate: String?
    var releaseDate: String?
    var posterPath: String?
    var id: Int?
    
    public init?(map: Map) {
        
    }
    
    mutating public func mapping(map: Map) {
        originalName <- map["original_name"]
        originalTitle <- map["original_title"]
        voteAverage <- map["vote_average"]
        firstAirDate <- map["first_air_date"]
        releaseDate <- map["release_date"]
        posterPath <- map["poster_path"]
        id <- map["id"]
    }
}

