//
//  ViewController.swift
//  SeSAC_Friends
//
//  Created by sungyeon kim on 2022/01/17.
//

import UIKit
import FirebaseAuth

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        try! Auth.auth().signOut()
        view.backgroundColor = .systemBackground
        let verificationID = UserDefaults.standard.string(forKey: "authVerificationID")
        print(verificationID)
    }

}
