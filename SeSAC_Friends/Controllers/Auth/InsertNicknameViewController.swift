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

        insertNicknameView.nicknamerTextField.addTarget(self, action: #selector(handleTextChange), for: .editingChanged)

    }

    @objc private func didTapNext() {
        let vc = InsertBirthViewController()
        let nickname = insertNicknameView.nicknamerTextField.text ?? ""
        UserDefaults.standard.set(nickname, forKey: "nickname")
        navigationController?.pushViewController(vc, animated: true)

    }

    @objc fileprivate func handleTextChange() {
        let textField = insertNicknameView.nicknamerTextField
        let button = insertNicknameView.nextButton

        checkValidation(textField: textField, button: button, validityType: .nickname)
    }

}
