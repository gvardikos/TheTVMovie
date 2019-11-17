//
//  SearchView.swift
//  TheTVMovie
//
//  Created by George Vardikos on 16/11/19.
//  Copyright © 2019 George Vardikos. All rights reserved.
//

import Stevia

final class SearchView: BaseView<SearchViewVM> {
    lazy var searchBar: UISearchBar = { [unowned self] in
        let searchBar = UISearchBar()
        searchBar.delegate = self
        return searchBar
    }()
    
    lazy var searchTableView: UITableView = { [unowned self] in
        let tableView = UITableView()
        tableView.tableFooterView = UIView()
        return tableView
    }()
        
    override func initialize() {
        setupUI()
    }
    
    fileprivate func setupUI() {
        self.backgroundColor = .white
        
        sv([searchBar, searchTableView])
        
        searchBar.Top == safeAreaLayoutGuide.Top
        searchBar.Left == safeAreaLayoutGuide.Left
        searchBar.Right == safeAreaLayoutGuide.Right
        
        searchTableView.Top == searchBar.Bottom
        searchTableView.Left == searchBar.Left
        searchTableView.Right == searchBar.Right
        searchTableView.Bottom == safeAreaLayoutGuide.Bottom
    }
}

extension SearchView: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        viewModel?.search(query: searchBar.text ?? "")
    }
}
