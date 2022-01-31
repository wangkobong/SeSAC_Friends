//
//  PutMyInfoViewController.swift
//  SeSAC_Friends
//
//  Created by sungyeon kim on 2022/01/26.
//

import UIKit

class PutMyInfoViewController: UIViewController {

    private let infoManageView = InfoManageView()
    private let reviewCollectionViewCell = ReviewCollectionViewCell()

    var buttons = [Buttons]()

    override func loadView() {
        self.view = infoManageView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print(UserDefaults.standard.string(forKey: K.idToken))
        view.backgroundColor = .systemBackground
        infoManageView.tableView.delegate = self
        infoManageView.tableView.dataSource = self

        buttons.append(Buttons(buttonTitle: "좋은 매너", bgColor: .brandColor(.green)))
        buttons.append(Buttons(buttonTitle: "정확한 시간 약속", bgColor: .brandColor(.green)))
        buttons.append(Buttons(buttonTitle: "빠른 응답", bgColor: .brandColor(.green)))
        buttons.append(Buttons(buttonTitle: "친절한 성격", bgColor: .brandColor(.green)))
        buttons.append(Buttons(buttonTitle: "능숙한 취미 실력", bgColor: .brandColor(.green)))
        buttons.append(Buttons(buttonTitle: "유익한 시간", bgColor: .brandColor(.green)))

        reviewCollectionViewCell.button1.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)

    }

    @objc func didTapButton() {
        print(#function)
    }
}

extension PutMyInfoViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: HeaderCell.reuseIdentifier, for: indexPath) as! HeaderCell
            let nickname = UserDefaults.standard.string(forKey: K.nickname) ?? ""
            cell.nicknameLabel.text = nickname
            return cell
        } else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: TitleCell.reuseIdentifier, for: indexPath) as! TitleCell
            cell.configure(with: buttons)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: PutCell.reuseIdentifier, for: indexPath) as! PutCell
            return cell
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 58
        } else if indexPath.section == 1 {
            return 120
        } else {
            return 300
        }

    }

}

struct Buttons {
    let buttonTitle: String
    let bgColor: UIColor

    init(buttonTitle: String, bgColor: UIColor) {
        self.buttonTitle = buttonTitle
        self.bgColor = bgColor
    }
}
