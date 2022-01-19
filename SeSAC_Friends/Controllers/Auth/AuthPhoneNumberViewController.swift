//
//  AuthViewController.swift
//  SeSAC_Friends
//
//  Created by sungyeon kim on 2022/01/18.
//

import UIKit

class AuthPhoneNumberViewController: UIViewController {

    let authPhoneNumberView = AuthPhoneView()
//    private let AuthPhoneNumberViewModel = AuthPhoneNumberViewModel()

    deinit {
        print("\(self) deinit")
    }

    override func loadView() {
        self.view = authPhoneNumberView

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        authPhoneNumberView.phoneNumberTextField.delegate = self

        authPhoneNumberView.getSMSButton.addTarget(self, action: #selector(didTapRequestSMS), for: .touchUpInside)

    }

    @objc private func didTapRequestSMS() {
//        let vc = InsertCodeViewController()
//        navigationController?.pushViewController(vc, animated: true)}
        if let text = authPhoneNumberView.phoneNumberTextField.text, !text.isEmpty {
            let number = "+82\(text)"
            AuthManager.shared.startAuth(phoneNumber: number) { [weak self] success in
                guard success else { return }
                DispatchQueue.main.async {
                    let vc = InsertCodeViewController()
                    vc.title = "Enter Code"
                    self?.navigationController?.pushViewController(vc, animated: true)
                }
            }
        }
    }
}

extension AuthPhoneNumberViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(#function)
        textField.resignFirstResponder()
        if let text = textField.text, !text.isEmpty {
            let number = "+82"
            AuthManager.shared.startAuth(phoneNumber: number) { [weak self] success in
                guard success else { return }
                DispatchQueue.main.async {
                    let vc = InsertCodeViewController()
                    vc.title = "Enter Code"
                    self?.navigationController?.pushViewController(vc, animated: true)
                }
            }
        }
        return true
    }

}
