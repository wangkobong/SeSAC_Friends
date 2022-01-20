//
//  InsertNicknameView.swift
//  SeSAC_Friends
//
//  Created by sungyeon kim on 2022/01/20.
//

import UIKit
import SnapKit

class InsertNickNameView: UIView {

    let nextButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.brandColor(.gray6)
        button.setTitle("다음", for: .normal)
        button.setTitleColor(UIColor.brandColor(.gray3), for: .normal)
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        return button
     }()

    private let dividingLine: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.brandColor(.gray3)
        return view
    }()

    let nicknamerTextField: UITextField = {
       let field = UITextField()
        field.placeholder = "10자 이내로 입력"
        field.font = UIFont.NotoSans(.regular, size: 14)
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        return field
    }()

    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.NotoSans(.regular, size: 20)
        label.text = "닉네임을 입력해 주세요"
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

        [nextButton, dividingLine, nicknamerTextField, descriptionLabel].forEach {
            addSubview($0)
        }
    }

    private func setupConstraints() {

        nextButton.snp.makeConstraints {
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
            $0.bottom.equalTo(nextButton.snp.top).offset(-72)
        }

        nicknamerTextField.snp.makeConstraints {
            $0.leading.equalTo(self).offset(28)
            $0.height.equalTo(22)
            $0.bottom.equalTo(dividingLine.snp.top).offset(-12)
        }

        descriptionLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(nicknamerTextField.snp.top).offset(-93)
            $0.height.equalTo(32)
        }
    }
}
