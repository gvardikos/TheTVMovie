//
//  Repository.swift
//  TheTVMovie
//
//  Created by George Vardikos on 16/11/19.
//  Copyright © 2019 George Vardikos. All rights reserved.
//

import Foundation
import ObjectMapper

public typealias SearchCallback = (SearchReposne?, Error?) -> Void
public typealias MovieDetailsCallback = (MovieDetailsResponse?, Error?) -> Void

@objc final public class Repository: NSObject, IRepository {
    private static var privateShared: Repository?
    
    @objc public static var shared: Repository {
        guard let uwShared = privateShared else {
            privateShared = Repository()
            return privateShared!
        }
        return uwShared
    }
    
    private var network: INetworkLayer
    
    private override init() {
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
    public func search(query: String, page: String, result: @escaping SearchCallback) {
        func mainWork() {
            network.search(query: query, page: page) { (response, error) in
                guard let response = response, error == nil else {
                    Log.shared.log(error ?? "Error was nil")
                    return
                }
                                
                result(response, nil)
            }
        }
        
        mainWork()
    }
    
    /// <#Description#>
    /// - Parameters:
    ///   - id: <#id description#>
    ///   - result: <#result description#>
    @objc func fetchTVShowDetails(id: String, result: @escaping MovieDetailsCallback) {
        func mainWork() {
            network.fetchTVShowDetails(id: id) { (response, error) in
                guard let response = response, error == nil else {
                    Log.shared.log(error ?? "Error was nil")
                    return
                }
                                
                result(response, nil)
            }
        }
        
        mainWork()
    }
}
