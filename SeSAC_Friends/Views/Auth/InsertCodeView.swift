//
//  InsertCodeView.swift
//  SeSAC_Friends
//
//  Created by sungyeon kim on 2022/01/19.
//

import UIKit
import SnapKit

class InsertCodeView: UIView {

    let authButton: UIButton = {
         let button = UIButton()
         button.backgroundColor = UIColor(named: "BrandGray6")
         button.setTitle("인증하고 시작하기", for: .normal)
         button.setTitleColor(UIColor(named: "BrandGray3"), for: .normal)
         button.layer.cornerRadius = 8
         button.layer.masksToBounds = true
        button.isEnabled = false
         return button
     }()

    let resendButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "BrandGreen")
        button.setTitle("재전송", for: .normal)
        button.setTitleColor(UIColor(named: "BrandWhite"), for: .normal)
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        return button
    }()

    private let dividingLine: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "BrandGray3")
        return view
    }()

    let SMSCodeTextField: UITextField = {
       let field = UITextField()
        field.placeholder = "인증번호 입력"
        field.font = UIFont.NotoSans(.regular, size: 14)
        field.keyboardType = .numberPad
        return field
    }()

    let stackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 0
        stackView.distribution = .fillEqually
        return stackView
    }()

    let resultLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.NotoSans(.regular, size: 20)
        label.text = "인증번호가 문자로 전송되었어요"
        label.textColor = UIColor.brandColor(.black)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()

    let secondLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.NotoSans(.regular, size: 16)
        label.textColor = UIColor.brandColor(.gray7)
        label.text = "(최대 소모 60초)"
        label.textAlignment = .center
        return label
    }()

    let timeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.NotoSans(.medium, size: 14)
        label.textColor = UIColor.brandColor(.green)
        label.text = "60초"
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
        stackView.addArrangedSubview(resultLabel)
        stackView.addArrangedSubview(secondLabel)

        [authButton, resendButton, dividingLine, SMSCodeTextField, timeLabel, stackView].forEach {
            addSubview($0)
        }
    }

    private func setupConstraints() {
        stackView.snp.makeConstraints {
            $0.leading.equalTo(self).offset(57)
            $0.trailing.equalTo(self).offset(-57)
            $0.bottom.equalTo(resendButton.snp.top).offset(-69)
            $0.height.equalTo(66)
        }

        authButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.leading.equalTo(self).offset(16)
            $0.trailing.equalTo(self).offset(-16)
            $0.bottom.equalToSuperview().multipliedBy(0.65)
            $0.height.equalTo(48)
        }

        resendButton.snp.makeConstraints {
            $0.trailing.equalTo(self).offset(-16)
            $0.width.equalTo(72)
            $0.height.equalTo(40)
            $0.bottom.equalTo(dividingLine)
        }
        timeLabel.snp.makeConstraints {
            $0.height.equalTo(22)
            $0.trailing.equalTo(resendButton.snp.leading).offset(-20)
            $0.bottom.equalTo(dividingLine.snp.top).offset(-12)
        }

        dividingLine.snp.makeConstraints {
            $0.height.equalTo(1)
            $0.leading.equalTo(self).offset(16)
            $0.trailing.equalTo(resendButton.snp.leading).offset(-8)
            $0.bottom.equalTo(authButton.snp.top).offset(-72)
        }

        SMSCodeTextField.snp.makeConstraints {
            $0.leading.equalTo(self).offset(28)
            $0.height.equalTo(22)
            $0.bottom.equalTo(dividingLine.snp.top).offset(-12)
        }

    }
}
