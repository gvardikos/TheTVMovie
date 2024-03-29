//
//  SearchViewVM.swift
//  TheTVMovie
//
//  Created by George Vardikos on 16/11/19.
//  Copyright © 2019 George Vardikos. All rights reserved.
//

import Foundation

public enum SearchViewVMState {
    case loading
    case finishedLoading
    case error(Error)
}

final public class SearchViewVM {
    public var searchText: String = ""
    
    private(set) var searchTVCellViewModels: [SearchTVCellVM] = []
    
    public var state = Observable<SearchViewVMState>(.finishedLoading)
    
    var repository: IRepository
    
    init(repository: IRepository = Repository.shared) {
        self.repository = Repository.shared
    }
    
    /// <#Description#>
    /// - Parameter query: <#query description#>
    public func search(query: String) {
        state.value = .loading
        repository.search(query: query, page: "1") { [weak self] (searchResult, error) in
            guard let shows = searchResult?.results, error == nil else {
                self?.state.value = .error(error!)
                return
            }
            
            self?.searchTVCellViewModels = shows.map { SearchTVCellVM(show: $0) }
            self?.state.value = .finishedLoading
        }
    }
}
