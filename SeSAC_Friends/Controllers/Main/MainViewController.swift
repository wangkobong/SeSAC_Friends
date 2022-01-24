//
//  ViewController.swift
//  SeSAC_Friends
//
//  Created by sungyeon kim on 2022/01/17.
//

import UIKit
import FirebaseAuth

class MainViewController: UIViewController {

    private let mainView = MainView()

    override func loadView() {
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow

        mainView.button3.addTarget(self, action: #selector(withdraw), for: .touchUpInside)

    }

    @objc private func withdraw() {
        print(#function)
        AuthManager.withdraw { success, statusCode in
            if success {
                switch statusCode {
                case 200:
                    UserDefaults.standard.set(false, forKey: "isSignedUp")
                    DispatchQueue.main.async {
                        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
                        let vc = UINavigationController(rootViewController: AuthPhoneNumberViewController())
                        windowScene.windows.first?.rootViewController = vc
                        windowScene.windows.first?.makeKeyAndVisible()
                    }
                case 401:
                    UserDefaults.standard.set(false, forKey: "isSignedUp")
                    print("401, Firebase Token Error")
                case 406:
                    print("이미 탈퇴 처리된 회원 // 온보딩 화면으로 이동")
                case 500:
                    print("500, Server Error")
                default:
                    print("nothing")
                }
            }
        }
    }

}
