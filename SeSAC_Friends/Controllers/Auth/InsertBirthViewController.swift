//
//  InsertBirthViewController.swift
//  SeSAC_Friends
//
//  Created by sungyeon kim on 2022/01/20.
//

import UIKit
import Toast

class InsertBirthViewController: UIViewController {

    private let insertBirthView = InsertBirthView()
    var nickname = ""
    private var birthDate: Date?
    private var calculatedAge: Int?

    deinit {
        print("\(self) deinit")
    }

    override func loadView() {
        self.view = insertBirthView

    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        let textFields = [insertBirthView.yearTextField, insertBirthView.dayTextField, insertBirthView.monthTextField]
        insertBirthView.yearTextField.delegate = self
        textFields.forEach { $0.delegate = self }
        insertBirthView.yearTextField.setInputViewDatePicker(target: self, selector: #selector(tapYearDone))
        insertBirthView.monthTextField.setInputViewDatePicker(target: self, selector: #selector(tapMonthDone))
        insertBirthView.dayTextField.setInputViewDatePicker(target: self, selector: #selector(tapDayDone))
        insertBirthView.nextButton2.addTarget(self, action: #selector(didTapNext), for: .touchUpInside)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
      self.view.endEditing(true)
    }

    func slicingDate(datePicker: UIDatePicker) {
        changeButton()
        let selectedDay = datePicker.date
        let selectedDayToString = selectedDay.dateToString(date: selectedDay)
        let year = selectedDayToString.substring(fromIndex: 0, count: 4)
        let month = selectedDayToString.substring(fromIndex: 5, count: 2)
        let day = selectedDayToString.substring(fromIndex: 8, count: 2)
        insertBirthView.yearTextField.text = year
        insertBirthView.monthTextField.text = month
        insertBirthView.dayTextField.text = day
        self.birthDate = selectedDay
        self.calculatedAge = selectedDay.getAge(birthDay: selectedDay)
    }

    private func pushVC() {
        let vc = InsertEmailViewController()

        guard let dateOfBirth = birthDate else {
            self.view.makeToast("??????????????? ??????????????????.", duration: 1.5, position: .center, title: "??????????????????")
            return
        }
        guard calculatedAge! >= 17 else {
            self.view.makeToast("17??? ????????? ?????? ???????????????.", duration: 1.5, position: .center, title: "????????????")
            return
        }
        UserDefaults.standard.set("\(dateOfBirth)", forKey: K.birthDate)
        navigationController?.pushViewController(vc, animated: true)
    }

    private func changeButton() {
        insertBirthView.nextButton2.backgroundColor = .brandColor(.green)
        insertBirthView.nextButton2.isEnabled = true
    }

    @objc private func didTapNext() {
        pushVC()
    }

    @objc func tapYearDone() {
        guard let yearDatePicker = insertBirthView.yearTextField.inputView as? UIDatePicker else { return }
        slicingDate(datePicker: yearDatePicker)
    }
    @objc func tapMonthDone() {
        guard let monthDatePicker = insertBirthView.monthTextField.inputView as? UIDatePicker else { return }
        slicingDate(datePicker: monthDatePicker)
    }

    @objc func tapDayDone() {
        guard let dayDatePicker = insertBirthView.dayTextField.inputView as? UIDatePicker else { return }
        slicingDate(datePicker: dayDatePicker)
    }

}

extension InsertBirthViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pushVC()
        return true
    }

}
