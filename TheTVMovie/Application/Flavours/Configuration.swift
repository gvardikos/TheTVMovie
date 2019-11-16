//
//  Configuration.swift
//  TheTVMovie
//
//  Created by George Vardikos on 16/11/19.
//  Copyright © 2019 George Vardikos. All rights reserved.
//

import Foundation

enum Configuration {
    enum Error: Swift.Error {
        case missingKey, invalidValue
    }
    
    static func value<T>(for key: String) throws -> T where T: LosslessStringConvertible {
        guard let object = Bundle.main.object(forInfoDictionaryKey: key) else {
            throw Error.missingKey
        }
        
        switch object {
        case let value as T:
            return value
        case let string as String:
            guard let value = T(string) else { fallthrough }
            return value
        default:
            throw Error.invalidValue
        }
    }
}

enum API {
    // swiftlint:disable force_try
    // Disable the Lint: I think this is a straitfoward case. Maybe review it later
    static var baseURL: URL {
        let base: String = try! Configuration.value(for: "API_BASE_URL")
        return URL(string: "http://" + base)!
    }
    
    static var key: String {
        return try! Configuration.value(for: "API_KEY")
    }
}
