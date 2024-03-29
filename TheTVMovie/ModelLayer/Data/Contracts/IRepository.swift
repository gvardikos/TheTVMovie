//
//  IRepository.swift
//  TheTVMovie
//
//  Created by George Vardikos on 16/11/19.
//  Copyright © 2019 George Vardikos. All rights reserved.
//

import Foundation

protocol IRepository {
    func search(query: String, page: String, result: @escaping SearchCallback)
    func fetchTVShowDetails(id: String, result: @escaping MovieDetailsCallback)
}
