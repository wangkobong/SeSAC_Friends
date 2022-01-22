//
//  InsertEmailViewController.swift
//  SeSAC_Friends
//
//  Created by sungyeon kim on 2022/01/19.
//

import UIKit

class InsertEmailViewController: UIViewController {

    var userBirth: Date?
    let validityType: String.ValidityType = .email

    private let insertEmailView = InsertEmailView()

    deinit {
        print("\(self) deinit")
    }

    override func loadView() {
        self.view = insertEmailView

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        print(#function, userBirth)

        insertEmailView.nextButton3.addTarget(self, action: #selector(didTabNext), for: .touchUpInside)

        insertEmailView.emailTextField.addTarget(self, action: #selector(handleTextChange), for: .editingChanged)

    }
    @objc private func didTabNext() {
        let vc = SelectGenderViewController()
//        vc.userBirth = passDate
        navigationController?.pushViewController(vc, animated: true)
    }

    @objc fileprivate func handleTextChange() {
        let textField = insertEmailView.emailTextField
        let button = insertEmailView.nextButton3

        checkValidation(textField: textField, button: button, validityType: .email)
    }

}
