//
//  SearchVC.swift
//  TheTVMovie
//
//  Created by George Vardikos on 16/11/19.
//  Copyright © 2019 George Vardikos. All rights reserved.
//

import Stevia

private let tableCellHeight: CGFloat = 160

final class SearchVC: BaseViewController {
    private lazy var contentView = SearchView(vm: searchViewModel, frame: .zero)
    private var searchViewModel: SearchViewVM
    
    init(searchViewModel: SearchViewVM = SearchViewVM()) {
        self.searchViewModel = searchViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        bindings()
    }
    
    public override func loadView() { view = contentView }
    
    fileprivate func setupTableView() {
        contentView.searchTableView.register(
            SearchTVCell.self,
            forCellReuseIdentifier: SearchTVCell.reuseIdentifier)
        contentView.searchTableView.dataSource = self
        contentView.searchTableView.delegate = self
    }
    
    fileprivate func bindings() {
        searchViewModel.shows.bind { [unowned self] (_) in
            self.contentView.searchTableView.reloadData()
        }
        
        searchViewModel.state.bind { [unowned self] (state) in
            switch state {
            case .loading: self.contentView.showBlurLoader()
            case .finishedLoading: self.contentView.removeBluerLoader()
            case .error(let error): self.showError(error)
            }
        }
    }
}

extension SearchVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchViewModel.shows.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell =
            contentView.searchTableView.dequeueReusableCell(
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

extension SearchVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let showDetailsVC = ShowDetailsVC()
        show(showDetailsVC, sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
