//
//  BaseView.swift
//  TheTVMovie
//
//  Created by George Vardikos on 16/11/19.
//  Copyright © 2019 George Vardikos. All rights reserved.
//

import Stevia

class BaseView<VM>: UIView {
    var viewModel: VM?
    
    init() {
        super.init(frame: .zero)
        self.initialize()
    }
    
    init(vm: VM, frame: CGRect) {
        super.init(frame: .zero)
        self.initialize()
        self.viewModel = vm
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initialize()
    }
    
    public func initialize() {

    }
}
