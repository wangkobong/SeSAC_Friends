//
//  FourthViewController.swift
//  SeSAC_Friends
//
//  Created by sungyeon kim on 2022/01/25.
//

import UIKit

class MyInfoViewController: UIViewController {

    private let myInfoView = MyInfoView()
    private let putCell = PutCell()

    let images = ["notice", "faq", "qna", "setting_alarm", "permit"]
    let cellTexts = ["공지사항", "자주 묻는 질문", "1:1 문의", "알림 설정", "이용 약관"]

    var userInfo: User?

    override func loadView() {
        self.view = myInfoView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        title = "내정보"
        myInfoView.tableView.delegate = self
        myInfoView.tableView.dataSource = self

        AuthManager.getUser { user, statusCode in
            print("로그인 상태코드: \(statusCode)")
            guard let user = user else {
                switch statusCode {
                case 201:
                    print("미가입유저, 회원가입으로 이동")
                case 401:
                    print("Firebase Token Error")
                case 500:
                    print("Server Error")
                case 501:
                    print("Client Error")
                default:
                    print("default")
                }
                return
            }
            self.userInfo = user

        }
    }

}

extension MyInfoViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return section == 0 ? 1 : cellTexts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = indexPath.section
        if section == 0 {
            guard let myInfoCell = tableView.dequeueReusableCell(withIdentifier: MyInfoCell.reuseIdentifier, for: indexPath) as? MyInfoCell else {

                return UITableViewCell()
            }
            let nickname = UserDefaults.standard.string(forKey: K.nickname) ?? ""
            myInfoCell.nicknameLabel.text = nickname
            return myInfoCell

        } else {

            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            cell.imageView?.image = UIImage(named: images[indexPath.row])
            cell.textLabel?.text = cellTexts[indexPath.row]
            cell.selectionStyle = .none
            tableView.separatorInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
            return cell
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        return indexPath.section == 0 ? 96 : 74

    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath == [0, 0] {
            DispatchQueue.main.async {
                let vc = PutMyInfoViewController()
                vc.title = "정보 관리"
                vc.userInfo = self.userInfo

                self.navigationController?.pushViewController(vc, animated: true)
            }
        } else {
           return
        }
    }

}
