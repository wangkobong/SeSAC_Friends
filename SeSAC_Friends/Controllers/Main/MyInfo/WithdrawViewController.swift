//
//  WithdrawViewController.swift
//  SeSAC_Friends
//
//  Created by sungyeon kim on 2022/01/31.
//

import UIKit

class WithdrawViewController: UIViewController {

    let withdrawAlertView = WithdrawAlertView()

    override func loadView() {
        self.view = withdrawAlertView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.isOpaque = false
        view.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.4)

        withdrawAlertView.cancelButton.addTarget(self, action: #selector(didTapCancel), for: .touchUpInside)

        withdrawAlertView.okButton.addTarget(self, action: #selector(didTapOk), for: .touchUpInside)
    }

    @objc private func didTapCancel() {
        self.dismiss(animated: true, completion: nil)
    }

    @objc private func didTapOk() {
        print(#function)
        AuthManager.withdraw { success, statusCode in
            if success {
                switch statusCode {
                case 200:
                    UserDefaults.standard.set(false, forKey: "isSignedUp")
                    DispatchQueue.main.async {
                        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
                        let vc = UINavigationController(rootViewController: OnboardingViewController())
                        windowScene.windows.first?.rootViewController = vc
                        windowScene.windows.first?.makeKeyAndVisible()
                    }
                case 401:
                    UserDefaults.standard.set(false, forKey: "isSignedUp")
                    print("401, Firebase Token Error")
                case 406:
                    UserDefaults.standard.set(false, forKey: "isSignedUp")
                    DispatchQueue.main.async {
                        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
                        let vc = UINavigationController(rootViewController: OnboardingViewController())
                        windowScene.windows.first?.rootViewController = vc
                        windowScene.windows.first?.makeKeyAndVisible()
                    }
                case 500:
                    print("500, Server Error")
                default:
                    print("nothing")
                }
            }
        }
    }

}
