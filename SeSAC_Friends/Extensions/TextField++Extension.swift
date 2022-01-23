//
//  TextField++Extension.swift
//  SeSAC_Friends
//
//  Created by sungyeon kim on 2022/01/21.
//

import UIKit

extension UITextField {
    func setInputViewDatePicker(target: Any, selector: Selector) {
        // Create a UIDatePicker object and assign to inputView
        let screenWidth = UIScreen.main.bounds.width
        let datePicker = UIDatePicker(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenWidth))// 1
        let dateFormatter = DateFormatter()
        datePicker.date = Calendar.current.date(byAdding: .year, value: -18, to: Date())!
        datePicker.datePickerMode = .date // 2
        datePicker.locale = Locale(identifier: "ko_KR")
        dateFormatter.locale = Locale(identifier: "ko_KR")
        // iOS 14 and above
        if #available(iOS 14, *) {// Added condition for iOS 14
          datePicker.preferredDatePickerStyle = .wheels
          datePicker.sizeToFit()
        }
        self.inputView = datePicker // 3

        // Create a toolbar and assign it to inputAccessoryView
        let toolBar = UIToolbar(frame: CGRect(x: 0.0, y: 0.0, width: screenWidth, height: 44.0)) // 4
        let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil) // 5
        let cancel = UIBarButtonItem(title: "Cancel", style: .plain, target: nil, action: #selector(tapCancel)) // 6
        let barButton = UIBarButtonItem(title: "Done", style: .plain, target: target, action: selector) // 7
        toolBar.setItems([cancel, flexible, barButton], animated: false) // 8
        self.inputAccessoryView = toolBar // 9
    }

    @objc func tapCancel() {
        self.resignFirstResponder()
    }

}
