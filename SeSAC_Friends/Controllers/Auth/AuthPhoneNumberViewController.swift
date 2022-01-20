//
//  AuthViewController.swift
//  SeSAC_Friends
//
//  Created by sungyeon kim on 2022/01/18.
//

import UIKit

class AuthPhoneNumberViewController: UIViewController {

    let authPhoneNumberView = AuthPhoneView()
    let authPhoneNumberViewModel = AuthPhoneNumberViewModel()

    deinit {
        print("\(self) deinit")
    }

    override func loadView() {
        self.view = authPhoneNumberView

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        FirebaseManager.shared.checkToken { token, _ in
            print("token: \(token)")
        }
        authPhoneNumberView.phoneNumberTextField.delegate = self

        authPhoneNumberViewModel.phoneNumber.bind { text in
            self.authPhoneNumberView.phoneNumberTextField.text = text
        }

        authPhoneNumberView.phoneNumberTextField.addTarget(self, action: #selector(phoneNumberFieldChange(_:)), for: .editingChanged)

        authPhoneNumberView.getSMSButton.addTarget(self, action: #selector(didTapRequestSMS), for: .touchUpInside)

    }

    func requestSMS() {
        authPhoneNumberViewModel.startAuth { [weak self] success in
            if success {
                DispatchQueue.main.async {
                    let vc = InsertCodeViewController()
                    self?.navigationController?.pushViewController(vc, animated: true)
                }
            } else {
                print("문자인증실패")
            }
        }

    }

    @objc private func phoneNumberFieldChange(_ textfield: UITextField) {
        authPhoneNumberViewModel.phoneNumber.value = textfield.text ?? ""
    }

    @objc private func didTapRequestSMS() {
        requestSMS()
    }
}

extension AuthPhoneNumberViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        requestSMS()
        return true
    }

}
