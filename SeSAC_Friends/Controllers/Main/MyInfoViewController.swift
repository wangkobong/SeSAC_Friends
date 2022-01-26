//
//  FourthViewController.swift
//  SeSAC_Friends
//
//  Created by sungyeon kim on 2022/01/25.
//

import UIKit

class MyInfoViewController: UIViewController {

    private let myInfoView = MyInfoView()

    let images = ["notice", "faq", "more", "setting_alarm", "permit"]
    let cellTexts = ["공지사항", "자주 묻는 질문", "1:1 문의", "알림 설정", "이용 약관"]

    override func loadView() {
        self.view = myInfoView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        title = "내정보"
        myInfoView.tableView.delegate = self
        myInfoView.tableView.dataSource = self
    }

}

extension MyInfoViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return cellTexts.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = indexPath.section
        if section == 0 {
            guard let myInfoCell = tableView.dequeueReusableCell(withIdentifier: MyInfoCell.reuseIdentifier, for: indexPath) as? MyInfoCell else {
                return UITableViewCell()
            }

            return myInfoCell
        } else {

            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            cell.imageView?.image = UIImage(named: images[indexPath.row])
            cell.textLabel?.text = cellTexts[indexPath.row]
            tableView.separatorInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
            return cell
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let section = indexPath.section
        if section == 0 {
            return 96
        } else {
            return 74
        }

//        section == 0 ? return 96 : return 74
    }

}
