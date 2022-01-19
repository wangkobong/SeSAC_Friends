//
//  InputCodeViewController.swift
//  SeSAC_Friends
//
//  Created by sungyeon kim on 2022/01/19.
//

import UIKit

class InsertCodeViewController: UIViewController {

    private let insertCodeView = InsertCodeView()
//    private let AuthPhoneNumberViewModel = AuthPhoneNumberViewModel()

    deinit {
        print("\(self) deinit")
    }

    override func loadView() {
        self.view = insertCodeView

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        insertCodeView.authButton.addTarget(self, action: #selector(didTapSend), for: .touchUpInside)

    }
    @objc private func didTapSend() {
        if let text = insertCodeView.SMSCodeTextField.text, !text.isEmpty {
            let code = text
            AuthManager.shared.verifyCode(smsCode: code) { [weak self] success in
                guard success else { return }
                DispatchQueue.main.async {
                    let vc = InsertEmailViewController()
                    vc.title = "이메일"
                    self?.navigationController?.pushViewController(vc, animated: true)
                }
            }
        }
    }

//    @objc private func didTapRequestSMS() {
//        let vc = InsertCodeViewController()
//        navigationController?.pushViewController(vc, animated: true)}
}
