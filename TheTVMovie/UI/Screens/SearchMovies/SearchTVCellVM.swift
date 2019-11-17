//
//  SearchTVCellVM.swift
//  TheTVMovie
//
//  Created by George Vardikos on 17/11/19.
//  Copyright © 2019 George Vardikos. All rights reserved.
//

import Foundation

public final class SearchTVCellVM {
    public var name = ""
    public var imagePath = ""
    public var releaseDate = ""
    public var rating = ""
    
    private var result: Results
    
    init(show: Results) {
        self.result = show
     
        self.imagePath = API.assetsURL.absoluteString + (show.posterPath ?? "") 
        self.name = show.originalName ?? show.originalTitle ?? "NA"
        self.releaseDate = show.releaseDate ?? show.firstAirDate ?? "NA"
        self.rating = String(show.voteAverage ?? 0)
    }
}
