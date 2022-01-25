//
//  UIController++Extension.swift
//  SeSAC_Friends
//
//  Created by sungyeon kim on 2022/01/22.
//

import UIKit

extension UIViewController {
    func checkValidation(textField: UITextField, button: UIButton, validityType: String.ValidityType) {
        guard let text = textField.text  else { return }

        if text.isValid(validityType) {
            button.backgroundColor = .brandColor(.green)
            button.isEnabled = true
        } else {
            button.backgroundColor = .brandColor(.gray6)
            button.isEnabled = false
        }
    }

}
