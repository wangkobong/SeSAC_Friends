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
                        let tabVarVC = UITabBarController()
                        let vc1 = UINavigationController(rootViewController: HomeViewController())
                        let vc2 = UINavigationController(rootViewController: ShopViewController())
                        let vc3 = UINavigationController(rootViewController: FriendViewController())
                        let vc4 = UINavigationController(rootViewController: MyInfoViewController())
                        tabVarVC.setViewControllers([vc1, vc2, vc3, vc4], animated: false)
                        vc1.title = "홈"
                        vc2.title = "새싹샵"
                        vc3.title = "새싹친구"
                        vc4.title = "내정보"
                        guard let items = tabVarVC.tabBar.items else {
                            return
                        }
                        let images = ["homeGray", "giftGray", "sesacGray", "homeGray"]

                        for x in 0..<items.count {
                            items[x].image = UIImage(named: images[x])
                        }
                        windowScene.windows.first?.rootViewController = tabVarVC
                        windowScene.windows.first?.makeKeyAndVisible()
                    }
                case 201:
                    UserDefaults.standard.set(true, forKey: "isSignedUp")
                    print("이미 가입한 유저")
                    DispatchQueue.main.async {
                        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
                        let tabVarVC = UITabBarController()
                        let vc1 = UINavigationController(rootViewController: HomeViewController())
                        let vc2 = UINavigationController(rootViewController: ShopViewController())
                        let vc3 = UINavigationController(rootViewController: FriendViewController())
                        let vc4 = UINavigationController(rootViewController: MyInfoViewController())
                        tabVarVC.setViewControllers([vc1, vc2, vc3, vc4], animated: false)
                        vc1.title = "홈"
                        vc2.title = "새싹샵"
                        vc3.title = "새싹친구"
                        vc4.title = "내정보"
                        guard let items = tabVarVC.tabBar.items else {
                            return
                        }
                        let images = ["homeGray", "giftGray", "sesacGray", "homeGray"]

                        for x in 0..<items.count {
                            items[x].image = UIImage(named: images[x])
                        }
                        windowScene.windows.first?.rootViewController = tabVarVC
                        windowScene.windows.first?.makeKeyAndVisible()
                    }
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
