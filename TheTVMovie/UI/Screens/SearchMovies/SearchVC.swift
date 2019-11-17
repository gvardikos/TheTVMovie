//
//  SearchVC.swift
//  TheTVMovie
//
//  Created by George Vardikos on 16/11/19.
//  Copyright © 2019 George Vardikos. All rights reserved.
//

import Stevia

private let tableCellHeight: CGFloat = 140

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
        setupTitle()
    }
    
    public override func loadView() { view = contentView }
    
    private func setupTableView() {
        contentView.searchTableView.register(
            SearchTVCell.self,
            forCellReuseIdentifier: SearchTVCell.reuseIdentifier)
        contentView.searchTableView.dataSource = self
        contentView.searchTableView.delegate = self
    }
    
    private func bindings() {
        searchViewModel.state.bind { [unowned self] (state) in
            switch state {
            case .loading: self.contentView.showBlurLoader()
            case .finishedLoading:
                self.contentView.removeBluerLoader()
                self.contentView.searchTableView.reloadData()
            case .error(let error): self.showError(error)
            }
        }
    }
    
    private func setupTitle() {
        title = "Search for a show"
    }
}

extension SearchVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchViewModel.searchTVCellViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dequeuedCell = contentView.searchTableView.dequeueReusableCell(
                                withIdentifier: SearchTVCell.reuseIdentifier,
                                for: indexPath
                            )
        
        guard let searchCell = dequeuedCell as? SearchTVCell else {
            fatalError("Could not dequeue a cell")
        }
        
        searchCell.viewModel = searchViewModel.searchTVCellViewModels[indexPath.row]
        return searchCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableCellHeight
    }
}

extension SearchVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let showDetailsVC = ShowDetailsVC()
        showDetailsVC.showId = searchViewModel.searchTVCellViewModels[indexPath.row].id
        
        show(showDetailsVC, sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
