//
//  InsertEmailViewController.swift
//  SeSAC_Friends
//
//  Created by sungyeon kim on 2022/01/19.
//

import UIKit

class InsertEmailViewController: UIViewController {

    var userBirth: Date?

    private let insertNicknameView = InsertNickNameView()
//    private let AuthPhoneNumberViewModel = AuthPhoneNumberViewModel()

    deinit {
        print("\(self) deinit")
    }

    override func loadView() {
        self.view = insertNicknameView

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        print(#function, userBirth)
//        AuthPhoneNumberView.getSMSButton.addTarget(self, action: #selector(didTapRequestSMS), for: .touchUpInside)

    }

//    @objc private func didTapRequestSMS() {
//        let vc = InsertCodeViewController()
//        navigationController?.pushViewController(vc, animated: true)}

}
