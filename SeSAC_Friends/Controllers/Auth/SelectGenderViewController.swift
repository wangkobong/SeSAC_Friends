//
//  SelectGenderViewController.swift
//  SeSAC_Friends
//
//  Created by sungyeon kim on 2022/01/19.
//

import UIKit

class SelectGenderViewController: UIViewController {

    private let selectGenderView = SelectGenderView()
    var genderNumber = 3

    override func loadView() {
        self.view = selectGenderView

    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground

        [selectGenderView.maleButton, selectGenderView.femaleButton].forEach {
            $0.addTarget(self, action: #selector(didTapGender), for: .touchUpInside)
        }
    }

    @objc private func didTapGender(_ sender: UIButton) {
        if sender == selectGenderView.maleButton {
            genderNumber = 1
            selectGenderView.maleButton.backgroundColor = UIColor.brandColor(.whiteGreen)
            selectGenderView.femaleButton.backgroundColor = .systemBackground
            print("genderNumber: \(genderNumber)")
        } else {
            genderNumber = 0
            selectGenderView.maleButton.backgroundColor = .systemBackground
            selectGenderView.femaleButton.backgroundColor = UIColor.brandColor(.whiteGreen)
            print("genderNumber: \(genderNumber)")
        }

        if genderNumber != 3 {
            selectGenderView.nextButton4.backgroundColor = .brandColor(.green)
        } else {
            selectGenderView.nextButton4.backgroundColor = .brandColor(.gray6)
        }

    }

}
