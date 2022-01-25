//
//  TestViewController.swift
//  SeSAC_Friends
//
//  Created by sungyeon kim on 2022/01/25.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "친구찾기"
    }

    private let homeView = HomeView()

    override func loadView() {
        view = homeView
    }

}
