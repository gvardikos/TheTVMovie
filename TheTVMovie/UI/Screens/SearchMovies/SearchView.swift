//
//  SearchView.swift
//  TheTVMovie
//
//  Created by George Vardikos on 16/11/19.
//  Copyright © 2019 George Vardikos. All rights reserved.
//

import Stevia

private let tableCellHeight: CGFloat = 160

protocol SearchViewDelegate: class {
    func cellPressed(indexPath: IndexPath)
}

final class SearchView: BaseView<Any> {
    private lazy var searchBar: UISearchBar = { [unowned self] in
        let searchBar = UISearchBar()
        return searchBar
    }()
    
    private lazy var searchTableView: UITableView = { [unowned self] in
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.register(SearchTVCell.self, forCellReuseIdentifier: SearchTVCell.reuseIdentifier)
        return tableView
    }()
    
    weak var delegate: SearchViewDelegate?
    
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

extension SearchView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell =
            searchTableView.dequeueReusableCell(
                withIdentifier: SearchTVCell.reuseIdentifier,
                for: indexPath) as? SearchTVCell
            else
        {
            return UITableViewCell()
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableCellHeight
    }
}

extension SearchView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.cellPressed(indexPath: indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
