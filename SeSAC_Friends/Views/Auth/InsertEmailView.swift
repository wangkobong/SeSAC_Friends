//
//  InsertEmailView.swift
//  SeSAC_Friends
//
//  Created by sungyeon kim on 2022/01/19.
//

import UIKit
import SnapKit

class InsertEmailView: UIView {

    let getSMSButton: UIButton = {
         let button = UIButton()
         button.backgroundColor = UIColor(named: "BrandGray6")
         button.setTitle("인증 문자 받기", for: .normal)
         button.setTitleColor(UIColor(named: "BrandGray3"), for: .normal)
         button.layer.cornerRadius = 8
         button.layer.masksToBounds = true
         return button
     }()

    private let dividingLine: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.brandColor(.gray3)
        return view
    }()

    let phoneNumberTextField: UITextField = {
       let field = UITextField()
        field.placeholder = "휴대폰 번호(-없이 숫자만 입력)"
        field.font = UIFont.NotoSans(.regular, size: 14)
        field.keyboardType = .numberPad

        return field
    }()

    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.NotoSans(.regular, size: 20)
        label.text = "새싹 서비스 이용을 위해 \n휴대폰 번호를 입력해 주세요"
        label.numberOfLines = 0
        label.addInterlineSpacing(spacingValue: 3)
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

        [getSMSButton, dividingLine, phoneNumberTextField, descriptionLabel].forEach {
            addSubview($0)
        }
    }

    private func setupConstraints() {

        getSMSButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.leading.equalTo(self).offset(16)
            $0.trailing.equalTo(self).offset(-16)
            $0.bottom.equalTo(self).offset(-350)
            $0.height.equalTo(48)
        }

        dividingLine.snp.makeConstraints {
            $0.height.equalTo(1)
            $0.leading.equalTo(self).offset(16)
            $0.trailing.equalTo(self).offset(-16)
            $0.bottom.equalTo(getSMSButton.snp.top).offset(-72)
        }

        phoneNumberTextField.snp.makeConstraints {
            $0.leading.equalTo(self).offset(28)
            $0.height.equalTo(22)
            $0.bottom.equalTo(dividingLine.snp.top).offset(-12)
        }

        descriptionLabel.snp.makeConstraints {
            $0.height.equalTo(64)
            $0.leading.equalTo(self).offset(74)
            $0.trailing.equalTo(self).offset(-73)
            $0.bottom.equalTo(phoneNumberTextField.snp.top).offset(-77)
        }
    }
}
