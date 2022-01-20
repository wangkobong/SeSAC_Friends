//
//  InsertBirthView.swift
//  SeSAC_Friends
//
//  Created by sungyeon kim on 2022/01/20.
//

import UIKit
import SnapKit

class InsertBirthView: UIView {

    let nextButton2: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.brandColor(.gray6)
        button.setTitle("다음", for: .normal)
        button.setTitleColor(UIColor.brandColor(.gray3), for: .normal)
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        return button
     }()

    let yearTextField: UITextField = {
       let field = UITextField()
        field.font = UIFont.NotoSans(.regular, size: 14)
        field.placeholder = "1990"
        return field
    }()

    let monthTextField: UITextField = {
       let field = UITextField()
        field.font = UIFont.NotoSans(.regular, size: 14)
        field.placeholder = "1"
        return field
    }()

    let dayTextField: UITextField = {
       let field = UITextField()
        field.font = UIFont.NotoSans(.regular, size: 14)
        field.placeholder = "1"
        return field
    }()

    let yearLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.NotoSans(.regular, size: 16)
        label.text = "년"
        label.textAlignment = .center
        return label
    }()

    let monthLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.NotoSans(.regular, size: 16)
        label.text = "월"
        label.textAlignment = .center
        return label
    }()

    let dayLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.NotoSans(.regular, size: 16)
        label.text = "일"
        label.textAlignment = .center
        return label
    }()

    let datePicker: UIDatePicker = {
        let picker = UIDatePicker()

        picker.datePickerMode = .date
        return picker
    }()

    private let yearDividingLine: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.brandColor(.gray3)
        return view
    }()

    private let monthDividingLine: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.brandColor(.gray3)
        return view
    }()

    private let dayDividingLine: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.brandColor(.gray3)
        return view
    }()

    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.NotoSans(.regular, size: 20)
        label.text = "생년월일을 알려주세요"
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {

        [nextButton2, yearDividingLine, monthDividingLine, dayDividingLine, descriptionLabel, yearTextField, monthTextField, dayTextField, yearLabel, monthLabel, dayLabel].forEach {
            addSubview($0)
        }
    }

    private func setupConstraints() {
        nextButton2.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.leading.equalTo(self).offset(16)
            $0.trailing.equalTo(self).offset(-16)
            $0.bottom.equalTo(self).offset(-350)
            $0.height.equalTo(48)
        }

        yearDividingLine.snp.makeConstraints {
            $0.height.equalTo(1)
            $0.width.equalToSuperview().multipliedBy(0.20)
            $0.leading.equalTo(self).offset(35)
            $0.bottom.equalTo(nextButton2.snp.top).offset(-72)
        }

        monthDividingLine.snp.makeConstraints {
            $0.height.equalTo(1)
            $0.width.equalToSuperview().multipliedBy(0.20)
            $0.bottom.equalTo(nextButton2.snp.top).offset(-72)
            $0.centerX.equalToSuperview()
        }

        dayDividingLine.snp.makeConstraints {
            $0.height.equalTo(1)
            $0.width.equalToSuperview().multipliedBy(0.20)
            $0.trailing.equalTo(self).offset(-35)
            $0.bottom.equalTo(nextButton2.snp.top).offset(-72)
        }

        yearTextField.snp.makeConstraints {
            $0.leading.equalTo(self).offset(28)
            $0.bottom.equalTo(yearDividingLine.snp.top).offset(-12)
            $0.height.equalTo(22)
            $0.width.equalTo(32)
        }

        monthTextField.snp.makeConstraints {
            $0.leading.equalTo(yearLabel.snp.trailing).offset(35)
            $0.bottom.equalTo(yearDividingLine.snp.top).offset(-12)
            $0.height.equalTo(22)
            $0.width.equalTo(32)
        }

        dayTextField.snp.makeConstraints {
            $0.leading.equalTo(monthLabel.snp.trailing).offset(35)
            $0.bottom.equalTo(yearDividingLine.snp.top).offset(-12)
            $0.height.equalTo(22)
            $0.width.equalTo(32)
        }

        yearLabel.snp.makeConstraints {
            $0.width.equalTo(15)
            $0.height.equalTo(26)
            $0.leading.equalTo(yearDividingLine.snp.trailing).offset(4)
            $0.bottom.equalTo(yearDividingLine.snp.top).offset(-10)
        }

        monthLabel.snp.makeConstraints {
            $0.width.equalTo(15)
            $0.height.equalTo(26)
            $0.leading.equalTo(monthDividingLine.snp.trailing).offset(4)
            $0.bottom.equalTo(monthDividingLine.snp.top).offset(-10)
        }

        dayLabel.snp.makeConstraints {
            $0.width.equalTo(15)
            $0.height.equalTo(26)
            $0.leading.equalTo(dayDividingLine.snp.trailing).offset(4)
            $0.bottom.equalTo(dayDividingLine.snp.top).offset(-10)
        }

        descriptionLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(yearLabel.snp.top).offset(-91)
            $0.height.equalTo(32)
        }
    }
}
