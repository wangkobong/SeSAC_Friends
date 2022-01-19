//
//  ViewController.swift
//  SeSAC_Friends
//
//  Created by sungyeon kim on 2022/01/17.
//

import UIKit

class MainViewController: UIViewController {

    let verificationID = UserDefaults.standard.string(forKey: "authVerificationID")

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black
        print(verificationID)
    }

}
