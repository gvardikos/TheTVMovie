//
//  NetworkLayer.swift
//  TheTVMovie
//
//  Created by George Vardikos on 16/11/19.
//  Copyright © 2019 George Vardikos. All rights reserved.
//

import Alamofire
import ObjectMapper
import AlamofireObjectMapper

enum NetworkError: Error {
    case server(message: String)
    case emptyResponse(message: String)
}

typealias NetworkResult<T: Mappable> = (T?, Error?) -> Void

protocol INetworkLayer {
    func search(query: String, page: String, completion: @escaping NetworkResult<SearchReposne>)
}

final class NetworkLayer: INetworkLayer {
    private let session: SessionManager
    
    init() {
        session = SessionManager()
    }
    
    /// Network Interceptor
    /// - Parameters:
    ///   - urlRequest:
    ///   - completion: 
    func netRequest<T: Mappable>(_ urlRequest: URLRequestConvertible, completion: @escaping NetworkResult<T>) {
        session.request(urlRequest).responseObject(completionHandler: { (response: DataResponse<T>) in
            switch response.result {
            case .success:
                let searchResponse = response.result.value
                completion(searchResponse, nil)
            case .failure(let error):
                completion(nil, NetworkError.server(message: error.localizedDescription))
            }
        })
    }
}

extension NetworkLayer {
    
    /// <#Description#>
    /// - Parameter completion: <#completion description#>
    func search(query: String, page: String, completion: @escaping NetworkResult<SearchReposne>) {
        netRequest(Router.search(query: query, page: page)) { (responseObj, error) in
           completion(responseObj, error)
        }
    }
}
