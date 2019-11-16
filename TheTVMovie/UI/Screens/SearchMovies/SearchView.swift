//
//  SearchView.swift
//  TheTVMovie
//
//  Created by George Vardikos on 16/11/19.
//  Copyright © 2019 George Vardikos. All rights reserved.
//

import Stevia

final class SearchView: BaseView<Any> {
    private lazy var dummyButton: UIButton = { [unowned self] in
        let button = UIButton(type: .system)
        button.setTitle("click me", for: .normal)
        button.addTarget(self, action: #selector(handleClickMe), for: .touchUpInside)
        return button
    }()
    
    private lazy var searchBar: UISearchBar = { [unowned self] in
        let searchBar = UISearchBar()
        return searchBar
    }()
    
    override func initialize() {
        setupUI()
    }
    
    @objc fileprivate func handleClickMe() {
        Log.shared.log(11234)
//        let detailsVC = ShowDetailsVC()
//        show(detailsVC, sender: self)
    }
    
    fileprivate func setupUI() {
        self.backgroundColor = .white
        
        sv([searchBar, dummyButton])
        dummyButton.centerInContainer()
        
        searchBar.Top == safeAreaLayoutGuide.Top
        searchBar.Left == safeAreaLayoutGuide.Left
        searchBar.Right == safeAreaLayoutGuide.Right
    }
}
