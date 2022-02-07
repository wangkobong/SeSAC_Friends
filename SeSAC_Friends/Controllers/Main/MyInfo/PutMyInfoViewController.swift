//
//  PutMyInfoViewController.swift
//  SeSAC_Friends
//
//  Created by sungyeon kim on 2022/01/26.
//

import UIKit
import RangeSeekSlider

class PutMyInfoViewController: UIViewController {

    private let infoManageView = InfoManageView()
    private let reviewCollectionViewCell = ReviewCollectionViewCell()
    let putCell = PutCell()
    private let myInfoViewModel = MyInfoViewModel()

    var buttons = [Buttons]()
    var userInfo: User?
    var min: Int?
    var max: Int?

    deinit {
        print("deinit")
    }

    override func loadView() {
        self.view = infoManageView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print(UserDefaults.standard.string(forKey: K.idToken))

        view.backgroundColor = .systemBackground
        self.navigationController?.navigationBar.tintColor = UIColor.brandColor(.black)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "저장", style: .plain, target: self, action: #selector(didTapSave))

        min = userInfo?.ageMin
        max = userInfo?.ageMax

        infoManageView.tableView.delegate = self
        infoManageView.tableView.dataSource = self

        buttons.append(Buttons(buttonTitle: "좋은 매너", bgColor: .brandColor(.green)))
        buttons.append(Buttons(buttonTitle: "정확한 시간 약속", bgColor: .brandColor(.green)))
        buttons.append(Buttons(buttonTitle: "빠른 응답", bgColor: .brandColor(.green)))
        buttons.append(Buttons(buttonTitle: "친절한 성격", bgColor: .brandColor(.green)))
        buttons.append(Buttons(buttonTitle: "능숙한 취미 실력", bgColor: .brandColor(.green)))
        buttons.append(Buttons(buttonTitle: "유익한 시간", bgColor: .brandColor(.green)))

        myInfoViewModel.searchable.bind { isOn in
            self.putCell.isOnNumber = isOn
        }

        myInfoViewModel.ageMin.bind { ageMin in
            self.putCell.ageSlider.selectedMinValue = CGFloat(ageMin)
        }

        myInfoViewModel.ageMax.bind { ageMax in
            self.putCell.ageSlider.selectedMaxValue = CGFloat(ageMax)
        }

        myInfoViewModel.gender.bind { gender in
            self.putCell.gender = gender
        }

        myInfoViewModel.hobby.bind { hobby in
            self.putCell.hobbyTextField.text = hobby
        }

    }

    @objc private func didTapGenderButton(_ sender: UIButton) {

        if sender.tag == 1 {
            sender.isSelected = !sender.isSelected
            putCell.changeButtonBackgroundColor(buttonTag: sender.tag)
            putCell.passMaleNumber()
            print("femaleButton.isSelected \(putCell.femaleButton.isSelected)")
            print("maleButton.isSelected \(putCell.maleButton.isSelected)")
//            infoManageView.tableView.reloadData()

        } else {
            sender.isSelected = !sender.isSelected
            putCell.changeButtonBackgroundColor(buttonTag: sender.tag)
            putCell.passFemaleNumber()
            print("femaleButton.isSelected \(putCell.femaleButton.isSelected)")
            print("maleButton.isSelected \(putCell.maleButton.isSelected)")
//            infoManageView.tableView.reloadData()
        }

        myInfoViewModel.gender.value = putCell.gender
    }

    @objc private func switchDidChange(_ searchable: UISwitch) {
        putCell.passIsOn(isOn: searchable.isOn)
        myInfoViewModel.searchable.value = putCell.isOnNumber
    }

    @objc private func hobbyTextFieldDidChange(_ textField: UITextField) {
        myInfoViewModel.hobby.value = textField.text ?? ""
    }

    @objc func sliderDidSliding(_ slider: RangeSeekSlider) {
        min = Int(slider.selectedMinValue)
        max = Int(slider.selectedMaxValue)
        myInfoViewModel.ageMin.value = Int(slider.selectedMinValue)
        myInfoViewModel.ageMax.value = Int(slider.selectedMaxValue)
        infoManageView.tableView.reloadData()
    }

    @objc func didTabWithdrawal() {
        let vc = WithdrawViewController()
        vc.modalPresentationStyle = .overCurrentContext
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated: true, completion: nil)
    }

    @objc private func didTapSave() {
        myInfoViewModel.updateInfo { success, statusCode in
            if success {
                print("성공", statusCode)
            } else {
                print("실패", statusCode)
            }
        }
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
            guard let currentUser = userInfo else { return  cell}
            let buttonArr = [cell.maleButton, cell.femaleButton]
            cell.ageSlider.addTarget(self, action: #selector(sliderDidSliding), for: .touchUpInside)
            cell.hobbyTextField.addTarget(self, action: #selector(hobbyTextFieldDidChange(_:)), for: .editingChanged)
            cell.withdrawButton.addTarget(self, action: #selector(didTabWithdrawal), for: .touchUpInside)
            cell.permitSwitch.addTarget(self, action: #selector(switchDidChange(_:)), for: .touchUpInside)
            buttonArr.forEach {
                $0.addTarget(self, action: #selector(didTapGenderButton(_:)), for: .touchUpInside)
            }
            cell.load(isOn: currentUser.searchable, gender: currentUser.gender, ageMax: max!, ageMin: min!)
            return cell
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 58
        } else if indexPath.section == 1 {
            return 120
        } else {
            return 350
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
