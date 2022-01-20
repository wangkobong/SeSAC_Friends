//
//  InsertNicknameViewController.swift
//  SeSAC_Friends
//
//  Created by sungyeon kim on 2022/01/20.
//

import UIKit

class InsertNicknameViewController: UIViewController {

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

        insertNicknameView.nextButton.addTarget(self, action: #selector(didTapNext), for: .touchUpInside)

    }

    @objc private func didTapNext() {
        let vc = InsertBirthViewController()
        navigationController?.pushViewController(vc, animated: true)}

}
