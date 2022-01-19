//
//  AuthViewController.swift
//  SeSAC_Friends
//
//  Created by sungyeon kim on 2022/01/18.
//

import UIKit

class AuthPhoneNumberViewController: UIViewController {

    private let AuthPhoneNumberView = AuthPhoneView()
//    private let AuthPhoneNumberViewModel = AuthPhoneNumberViewModel()

    deinit {
        print("\(self) deinit")
    }

    override func loadView() {
        self.view = AuthPhoneNumberView

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

    }
    // ㅌ
}
