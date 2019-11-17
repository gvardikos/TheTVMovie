//
//  BaseVC.swift
//  TheTVMovie
//
//  Created by George Vardikos on 16/11/19.
//  Copyright © 2019 George Vardikos. All rights reserved.
//

import Stevia

public class BaseViewController: UIViewController {
    public override func viewDidLoad() {
        super.viewDidLoad()
        Log.shared.log(String(describing: self))
    }
    
    deinit {
        Log.shared.log(String(describing: self))
    }
    
    func showError(_ error: Error) {
        let alertController = UIAlertController(title: Constants.alert.errorTitle, message: error.localizedDescription, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: Constants.alert.okAction, style: .default) { [unowned self] _ in
            self.dismiss(animated: true, completion: nil)
        }
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
}
