//
//  InsertNicknameViewController.swift
//  SeSAC_Friends
//
//  Created by sungyeon kim on 2022/01/20.
//

import UIKit
import Toast

class InsertNicknameViewController: UIViewController {

    private let insertNicknameView = InsertNickNameView()
//    private let AuthPhoneNumberViewModel = AuthPhoneNumberViewModel()
    var isBack = false

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
        FirebaseManager.shared.checkToken { token, _ in
            print("token: \(token)")
        }

    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if isBack {
            let nickname = UserDefaults.standard.string(forKey: "nickname") ?? ""
            view.makeToast("다른 닉네임을 사용해주세요.", duration: 1.5, position: .center, title: "해당 닉네임(\(nickname))은 사용할 수 없습니다")
        }
    }

    @objc private func didTapNext() {
        let vc = InsertBirthViewController()
        let nickname = insertNicknameView.nicknamerTextField.text ?? ""
        UserDefaults.standard.set(nickname, forKey: K.nickname)
        navigationController?.pushViewController(vc, animated: true)

    }

    @objc fileprivate func handleTextChange() {
        let textField = insertNicknameView.nicknamerTextField
        let button = insertNicknameView.nextButton

        checkValidation(textField: textField, button: button, validityType: .nickname)
    }

}
