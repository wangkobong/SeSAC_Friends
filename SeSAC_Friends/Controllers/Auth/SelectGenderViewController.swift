//
//  SelectGenderViewController.swift
//  SeSAC_Friends
//
//  Created by sungyeon kim on 2022/01/19.
//

import UIKit

class SelectGenderViewController: UIViewController {

    private let selectGenderView = SelectGenderView()
    private let signUpViewModel = SignUpViewModel()
    var genderNumber = -1

    override func loadView() {
        self.view = selectGenderView

    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground

        [selectGenderView.maleButton, selectGenderView.femaleButton].forEach {
            $0.addTarget(self, action: #selector(didTapGender), for: .touchUpInside)
        }

        selectGenderView.nextButton4.addTarget(self, action: #selector(didTapSignUp), for: .touchUpInside)
    }

    @objc private func didTapSignUp() {
        print(#function)
        UserDefaults.standard.set(genderNumber, forKey: K.gender)
        signUpViewModel.signUp { [weak self] success, code in
//            guard let code = code else {
//                return
//            }
            if success {
                switch code {
                case 200:
                    UserDefaults.standard.set(true, forKey: "isSignedUp")
                    DispatchQueue.main.async {
                        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
                        let vc = UITabBarController()
                        windowScene.windows.first?.rootViewController = vc
                        windowScene.windows.first?.makeKeyAndVisible()
                    }
                case 201:
                    print("이미 가입한 유저")
                case 202:
                    let vc = InsertNicknameViewController()
                    vc.isBack = true
                    self?.navigationController?.pushViewController(vc, animated: true)
                case 401:
                    print("401")
                default:
                    print("nothing")
                }
            } else {

            }
        }
    }

    @objc private func didTapGender(_ sender: UIButton) {
        if sender == selectGenderView.maleButton {
            genderNumber = 1
            selectGenderView.maleButton.backgroundColor = UIColor.brandColor(.whiteGreen)
            selectGenderView.femaleButton.backgroundColor = .systemBackground
        } else {
            genderNumber = 0
            selectGenderView.maleButton.backgroundColor = .systemBackground
            selectGenderView.femaleButton.backgroundColor = UIColor.brandColor(.whiteGreen)
        }

        if genderNumber != -1 {
            selectGenderView.nextButton4.backgroundColor = .brandColor(.green)
        } else {
            selectGenderView.nextButton4.backgroundColor = .brandColor(.gray6)
        }

    }

}
