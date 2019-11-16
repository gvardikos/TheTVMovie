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
        
        bindings()
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
    
    fileprivate func showError(_ error: Error) {
        let alertController = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default) { [unowned self] _ in
            self.dismiss(animated: true, completion: nil)
        }
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
}

extension SearchVC: SearchViewDelegate {
    func cellPressed(indexPath: IndexPath) {
        let showDetailsVC = ShowDetailsVC()
        show(showDetailsVC, sender: nil)
    }
}
