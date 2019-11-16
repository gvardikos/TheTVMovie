//
//  SearchViewVM.swift
//  TheTVMovie
//
//  Created by George Vardikos on 16/11/19.
//  Copyright © 2019 George Vardikos. All rights reserved.
//

import Foundation
import Combine

final public class SearchViewVM {
    public var searchText: String = ""
    public var shows = Observable<[ShowDTO]>([])
    
     var repository: IRepository
    
    init() {
        self.repository = Repository.shared
    }
    
    /// <#Description#>
    /// - Parameter query: <#query description#>
    public func search(query: String) {
        repository.search(query: query, page: "1") { (str) in
            print(str)
            
            for _ in 1...10 {
                self.shows.value.append(ShowDTO())
            }
        }
    }
}
