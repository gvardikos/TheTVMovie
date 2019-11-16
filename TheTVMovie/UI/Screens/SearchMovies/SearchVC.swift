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
        
        searchViewModel.shows.bind { (_) in
            self.contentView.searchTableView.reloadData()
        }        
    }
    
    public override func loadView() {
        view = contentView
    }
}

final class SearchVC: BaseViewController {
    fileprivate lazy var contentView: SearchView = { [unowned self] in
        let view = SearchView(vm: searchViewModel, frame: .zero)
        view.delegate = self
        return view
    }()
    
    private var searchViewModel: SearchViewVM
    
    init(searchViewModel: SearchViewVM = SearchViewVM()) {
        self.searchViewModel = searchViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SearchVC: SearchViewDelegate {
    func cellPressed(indexPath: IndexPath) {
        let showDetailsVC = ShowDetailsVC()
        show(showDetailsVC, sender: nil)
    }
}
