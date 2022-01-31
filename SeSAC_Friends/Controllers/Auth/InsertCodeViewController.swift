//
//  InputCodeViewController.swift
//  SeSAC_Friends
//
//  Created by sungyeon kim on 2022/01/19.
//

import UIKit
import Toast

class InsertCodeViewController: UIViewController {

    private let insertCodeView = InsertCodeView()
    private let insertCodeViewModel = InsertCodeViewModel()
    private let authPhoneNumberViewModel = AuthPhoneNumberViewModel()

    var timerRemaining: Int = 60
    var timer: Timer!

    deinit {
        print("\(self) deinit")
    }

    override func loadView() {
        self.view = insertCodeView

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        insertCodeView.SMSCodeTextField.becomeFirstResponder()
        insertCodeViewModel.smsCode.bind { text in
            self.insertCodeView.SMSCodeTextField.text = text
        }

        insertCodeView.SMSCodeTextField.addTarget(self, action: #selector(smsCodeFieldChange(_:)), for: .editingChanged)

        insertCodeView.authButton.addTarget(self, action: #selector(didTapSend), for: .touchUpInside)
        view.makeToast("인증번호를 보냈습니다")

        insertCodeView.resendButton.addTarget(self, action: #selector(didTabResend), for: .touchUpInside)

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setTimer()
    }

    func sendSMSCode() {
        insertCodeViewModel.sendSMSCode { [weak self] success in
            if success {
                FirebaseManager.shared.checkToken { token, error in
                    guard let token = token, error == nil else {
                        self?.view.makeToast("에러가 발생했습니다. 잠시 후 다시 시도해주세요", duration: 1.5, position: .center, title: "에러발생")
                        return
                    }
                    print(self, token)
                    UserDefaults.standard.set(token, forKey: K.idToken)
                    AuthManager.checkSignUp(token: token) { success, statusCode in
                        print("문자인증후 응답코드: \(statusCode)")
                        if success && statusCode == 200 {
                            guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
                            let vc = UITabBarController()
                            windowScene.windows.first?.rootViewController = vc
                            windowScene.windows.first?.makeKeyAndVisible()
                        } else if success && statusCode == 201 {
                            DispatchQueue.main.async {
                                let vc = InsertNicknameViewController()
                                self?.navigationController?.pushViewController(vc, animated: true)
                            }
                        } else {
                            print("success: \(success)")
                            print("statusCode: \(statusCode)")
                        }
                    }
                }
            }
        }
    }

    func setTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(step), userInfo: nil, repeats: true)
    }

    func restartTimer() {
        timerRemaining = 60
        insertCodeView.timeLabel.text = "\(timerRemaining)초"
    }

    @objc private func didTapSend() {
        sendSMSCode()
        print(#function)
    }

    @objc private func didTabResend() {
        print("didTabResend")
        restartTimer()
        step()
        authPhoneNumberViewModel.startAuth { [weak self] success, _ in
            if success {
                DispatchQueue.main.async {
                    self?.view.makeToast("문자메세지를 확인해주세요")
                }
            } else {
                self?.view.makeToast("인증실패")
            }
        }
    }

    @objc private func smsCodeFieldChange(_ textfield: UITextField) {
        insertCodeViewModel.smsCode.value = textfield.text ?? ""
        let authButton = insertCodeView.authButton
        checkValidation(textField: textfield, button: authButton, validityType: .code)
    }

    @objc private func step() {
        if timerRemaining > 0 {
            timerRemaining -= 1
        } else {
            timer.invalidate()
        }
        insertCodeView.timeLabel.text = "\(timerRemaining)초"
    }

//    @objc private func didTapRequestSMS() {
//        let vc = InsertCodeViewController()
//        navigationController?.pushViewController(vc, animated: true)}
}
