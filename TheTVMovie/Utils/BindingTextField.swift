//
//  Bindable.swift
//  TheTVMovie
//
//  Created by George Vardikos on 16/11/19.
//  Copyright © 2019 George Vardikos. All rights reserved.
//

final public class BindingTextField: UITextField {
    var textChanged: (String) -> () = { _ in }
    
    func bind(callback :@escaping (String) -> ()) {
        self.textChanged = callback
        self.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    @objc func textFieldDidChange(_ textField :UITextField) {
        self.textChanged(textField.text!)
    }
}
