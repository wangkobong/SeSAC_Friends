//
//  InputCodeViewController.swift
//  SeSAC_Friends
//
//  Created by sungyeon kim on 2022/01/19.
//

import UIKit

class InsertCodeViewController: UIViewController {

    private let insertCodeView = InsertCodeView()
    private let insertCodeViewModel = InsertCodeViewModel()

    deinit {
        print("\(self) deinit")
    }

    override func loadView() {
        self.view = insertCodeView

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        insertCodeViewModel.smsCode.bind { text in
            self.insertCodeView.SMSCodeTextField.text = text
        }

        insertCodeView.SMSCodeTextField.addTarget(self, action: #selector(smsCodeFieldChange(_:)), for: .editingChanged)

        insertCodeView.authButton.addTarget(self, action: #selector(didTapSend), for: .touchUpInside)

    }

    func sendSMSCode() {
        insertCodeViewModel.sendSMSCode { success in
            if success {
                FirebaseManager.shared.checkToken { token, error in
                    guard let token = token else { return print(#function, error) }
                    UserDefaults.standard.set(token, forKey: "authVerificationID")
                    AuthManager.checkSignUp(token: token)
                }
            }
        }
    }

    @objc private func didTapSend() {
        sendSMSCode()
    }

    @objc private func smsCodeFieldChange(_ textfield: UITextField) {
        insertCodeViewModel.smsCode.value = textfield.text ?? ""
    }

//    @objc private func didTapRequestSMS() {
//        let vc = InsertCodeViewController()
//        navigationController?.pushViewController(vc, animated: true)}
}
