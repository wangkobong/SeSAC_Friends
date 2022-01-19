//
//  AuthManager.swift
//  SeSAC_Friends
//
//  Created by sungyeon kim on 2022/01/20.
//
import FirebaseAuth
import Foundation

class AuthManager {
    static let shared = AuthManager()

    private let auth = Auth.auth()

    private var verificationId: String?

    public func startAuth(phoneNumber: String, completion: @escaping (Bool) -> Void) {
        PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil) { [weak self] verificationId, error in
            guard let verificationId = verificationId, error == nil else {
                return
            }
            self?.verificationId = verificationId

            completion(true)
        }
    }

    public func verifyCode(smsCode: String, completion: @escaping (Bool) -> Void) {
        guard let verificationId = verificationId else {
            completion(false)
            return
        }

        let credential = PhoneAuthProvider.provider().credential(withVerificationID: verificationId, verificationCode: smsCode)

        auth.signIn(with: credential) { result, error in
            guard result != nil, error == nil else {
                completion(false)
                return
            }
            print("verificationId:\(verificationId)")
            print("credential:\(credential)")
            UserDefaults.standard.set(verificationId, forKey: "authVerificationID")
            completion(true)
        }
    }

}
