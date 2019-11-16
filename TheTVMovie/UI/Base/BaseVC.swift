//
//  BaseVC.swift
//  TheTVMovie
//
//  Created by George Vardikos on 16/11/19.
//  Copyright © 2019 George Vardikos. All rights reserved.
//

import Stevia

extension BaseViewController {
    public override func viewDidLoad() {
        super.viewDidLoad()
        Log.shared.log(String(describing: self))
    }
}

public class BaseViewController: UIViewController {
    deinit {
        Log.shared.log(String(describing: self))
    }
}
