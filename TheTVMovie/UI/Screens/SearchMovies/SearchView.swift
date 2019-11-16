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
    
    private lazy var searchTableView: UITableView = { [unowned self] in
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.register(SearchTVCell.self, forCellReuseIdentifier: SearchTVCell.reuseIdentifier)
        return tableView
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
        
        sv([searchBar, searchTableView, dummyButton])
        dummyButton.centerInContainer()
        
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
}

extension SearchView: UITableViewDelegate {
    
}
