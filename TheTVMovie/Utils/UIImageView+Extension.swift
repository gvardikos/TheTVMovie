//
//  UIImageView+Extension.swift
//  TheTVMovie
//
//  Created by George Vardikos on 17/11/19.
//  Copyright © 2019 George Vardikos. All rights reserved.
//

import UIKit
import Kingfisher

extension UIImageView {
    func loadImage(path: String,
                   defaultImage: UIImage? = nil,
                   cacheKey: String? = nil) {
        if let url = URL(string: path) {
            let resource = ImageResource(
                downloadURL: url,
                cacheKey: cacheKey == nil ? path : cacheKey!
            )
            
            kf.indicatorType = .activity
            kf.setImage(with: resource,
                        placeholder: nil,
                        options: [.transition(ImageTransition.fade(1))]
            ) {
                result in
                switch result {
                case .success( _): break
                case .failure(let error):
                    self.image = defaultImage
                    Log.shared.log("Job failed: \(error.localizedDescription)")
                }
            }
        } else {
            image = defaultImage
        }
    }
}
