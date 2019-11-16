//
//  Log.swift
//  TheTVMovie
//
//  Created by George Vardikos on 16/11/19.
//  Copyright © 2019 George Vardikos. All rights reserved.
//

import Foundation

final class Log {
    private static var privateShared: Log?
    
    public static var shared: Log {
        guard let uwShared = privateShared else {
            privateShared = Log()
            return privateShared!
        }
        return uwShared
    }
    
    static func destroy() {
        privateShared = nil
    }
    
    private init() {}
    
    public func log(_ message: String) {
        print("\(#function): \(message)")
    }
    
    public func log(_ obj: Any) {
        print(obj)
    }
}
