//
//  NetworkLayer.swift
//  TheTVMovie
//
//  Created by George Vardikos on 16/11/19.
//  Copyright © 2019 George Vardikos. All rights reserved.
//

import Alamofire

enum NetworkError: Error {
    case server(message: String)
    case emptyResponse(message: String)
}

typealias NetworkResult = (Data?, Error?) -> Void

protocol INetworkLayer {
    func search(query: String, page: String, completion: @escaping NetworkResult)
}

final class NetworkLayer: INetworkLayer {
    private let session: SessionManager
    
    init() {
        session = SessionManager()
    }

    func netRequest(_ urlRequest: URLRequestConvertible, completion: @escaping NetworkResult) {
        session.request(urlRequest).responseJSON { (response) in
            switch response.result {
            case .success:
                if let jsonData = response.data {
                    completion(jsonData, nil)
                } else {
                    completion(nil, NetworkError.emptyResponse(message: "Empty Response"))
                }
            case .failure(let error):
                completion(nil, NetworkError.server(message: error.localizedDescription))
            }
        }
    }
}

extension NetworkLayer {
    
    /// <#Description#>
    /// - Parameter completion: <#completion description#>
    func search(query: String, page: String, completion: @escaping NetworkResult) {
        netRequest(Router.search(query: query, page: page)) { (jsonData, error) in
           completion(jsonData, error)
        }
    }
}
