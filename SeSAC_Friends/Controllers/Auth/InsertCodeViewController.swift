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

//        AuthPhoneNumberView.getSMSButton.addTarget(self, action: #selector(didTapRequestSMS), for: .touchUpInside)

    }

//    @objc private func didTapRequestSMS() {
//        let vc = InsertCodeViewController()
//        navigationController?.pushViewController(vc, animated: true)}
}
