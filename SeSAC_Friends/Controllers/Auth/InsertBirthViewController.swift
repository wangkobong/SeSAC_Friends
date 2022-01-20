//
//  InsertBirthViewController.swift
//  SeSAC_Friends
//
//  Created by sungyeon kim on 2022/01/20.
//

import UIKit

class InsertBirthViewController: UIViewController {

    private let insertBirthView = InsertBirthView()

    deinit {
        print("\(self) deinit")
    }

    override func loadView() {
        self.view = insertBirthView

    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
    }

}
