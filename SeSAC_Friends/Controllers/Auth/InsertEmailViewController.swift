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
        guard let text = insertEmailView.emailTextField.text else { return }
        print(text)
        DispatchQueue.main.async {
            if text.isValid(self.validityType) {
                self.insertEmailView.nextButton3.backgroundColor = UIColor.brandColor(.green)
                self.insertEmailView.nextButton3.isEnabled = true
            } else {
                self.insertEmailView.nextButton3.backgroundColor = UIColor.brandColor(.gray6)
                self.insertEmailView.nextButton3.isEnabled = false
            }
        }
    }

}
