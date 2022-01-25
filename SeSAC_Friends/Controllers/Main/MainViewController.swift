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

        mainView.button3.addTarget(self, action: #selector(toHome), for: .touchUpInside)

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
    public func test() {

    }

    @objc private func toHome() {
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
//        tabVarVC.modalPresentationStyle = .fullScreen
//        present(tabVarVC, animated: true, completion: nil)
    }

}
