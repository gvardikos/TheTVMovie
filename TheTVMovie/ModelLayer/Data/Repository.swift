//
//  Repository.swift
//  TheTVMovie
//
//  Created by George Vardikos on 16/11/19.
//  Copyright © 2019 George Vardikos. All rights reserved.
//

import Foundation

final public class Repository {
    private static var privateShared: Repository?
    
    public static var shared: Repository {
        guard let uwShared = privateShared else {
            privateShared = Repository()
            return privateShared!
        }
        return uwShared
    }
    
    private var searchRepository: ISearchRepository
    
    private var network: INetworkLayer
    
    private init() {
        searchRepository = SearchRepository()
        network = NetworkLayer()
    }
    
    static func destroy() {
        privateShared = nil
    }
    
    /// <#Description#>
    /// - Parameters:
    ///   - query: <#query description#>
    ///   - completion: <#completion description#>
    public func search(query: String, completion: () -> Void) {
        func mainWork() {
            network.search { (data, error) in
                print(data)
                print(error)
            }
        }
        
        mainWork()
    }
}
