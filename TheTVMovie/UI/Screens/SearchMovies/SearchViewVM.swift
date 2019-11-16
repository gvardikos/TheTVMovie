//
//  SearchViewVM.swift
//  TheTVMovie
//
//  Created by George Vardikos on 16/11/19.
//  Copyright © 2019 George Vardikos. All rights reserved.
//

import Foundation
import Combine

public enum SearchViewVMState {
    case loading
    case finishedLoading
    case error(Error)
}

final public class SearchViewVM {
    public var searchText: String = ""
    public var shows = Observable<[Results]>([])
    
    public var state = Observable<SearchViewVMState>(.finishedLoading)
    
    var repository: IRepository
    
    init() {
        self.repository = Repository.shared
    }
    
    /// <#Description#>
    /// - Parameter query: <#query description#>
    public func search(query: String) {
        state.value = .loading
        repository.search(query: query, page: "1") { (searchResult) in
            Log.shared.log(searchResult)
            
            searchResult.results?.forEach({ (result) in
                self.shows.value.append(result)
            })
            
            self.state.value = .finishedLoading
        }
    }
}
