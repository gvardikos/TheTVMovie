//
//  SearchVC.swift
//  TheTVMovie
//
//  Created by George Vardikos on 16/11/19.
//  Copyright © 2019 George Vardikos. All rights reserved.
//

import Stevia

/// Controller LifeCycle Extension
extension SearchVC {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    public override func loadView() {
        view = contentView
    }
}

final class SearchVC: BaseViewController {
    fileprivate let contentView = SearchView()
}
