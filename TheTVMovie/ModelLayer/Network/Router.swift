//
//  Router.swift
//  TheTVMovie
//
//  Created by George Vardikos on 16/11/19.
//  Copyright © 2019 George Vardikos. All rights reserved.
//

import Alamofire

enum Router: URLRequestConvertible {
    case search(query: String, page: String)
    
    var httpMethod: HTTPMethod {
        switch self {
        case .search:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .search:
            return "/search/multi"
        }
    }
    
    var apiKey: String {
        return API.key
    }
    
    var baseUrl: URL {
        return API.baseURL
    }
    
    func asURLRequest() throws -> URLRequest {
        var request: URLRequest
        var parameters = [String: String]()
        
        switch self {
        case let .search(query, page):
            parameters.updateValue(apiKey, forKey: Constants.api.apiKey)
            parameters.updateValue(query, forKey: Constants.api.query)
            parameters.updateValue(page, forKey: Constants.api.page)
            
            request = URLRequest(url: baseUrl.appendingPathComponent(path))
            request = try URLEncoding.default.encode(request, with: parameters)
        }

        request.httpMethod = self.httpMethod.rawValue
        
        Log.shared.log("[NetRequest]: \(request)")
        
        return request
    }
}
