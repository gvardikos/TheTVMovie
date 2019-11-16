//
//  Repository.swift
//  TheTVMovie
//
//  Created by George Vardikos on 16/11/19.
//  Copyright © 2019 George Vardikos. All rights reserved.
//

import Foundation
import ObjectMapper

final public class Repository: IRepository {
    private static var privateShared: Repository?
    
    public static var shared: Repository {
        guard let uwShared = privateShared else {
            privateShared = Repository()
            return privateShared!
        }
        return uwShared
    }
    
    private var network: INetworkLayer
    
    private init() {
        network = NetworkLayer()
    }
    
    static func destroy() {
        privateShared = nil
    }
    
    
    /// <#Description#>
    /// - Parameters:
    ///   - query: <#query description#>
    ///   - page: <#page description#>
    ///   - completion: <#completion description#>
    public func search(query: String, page: String, completion: @escaping (SearchReposne) -> Void) {
        func mainWork() {
            network.search(query: query, page: page) { (response, error) in
                guard let response = response, error == nil else {
                    Log.shared.log(error ?? "Error was nil")
                    return
                }
                                
                completion(response)
            }
        }
        
        mainWork()
    }
}
