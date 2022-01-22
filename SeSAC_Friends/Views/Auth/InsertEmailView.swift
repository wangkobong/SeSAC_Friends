//
//  InsertEmailView.swift
//  SeSAC_Friends
//
//  Created by sungyeon kim on 2022/01/19.
//

import UIKit
import SnapKit

class InsertEmailView: UIView {

    let nextButton3: UIButton = {
         let button = UIButton()
         button.backgroundColor = UIColor(named: "BrandGray6")
         button.setTitle("다음", for: .normal)
         button.setTitleColor(UIColor(named: "BrandGray3"), for: .normal)
         button.layer.cornerRadius = 8
         button.layer.masksToBounds = true
        button.isEnabled = false
         return button
     }()

    private let dividingLine: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.brandColor(.gray3)
        return view
    }()

    let emailTextField: UITextField = {
       let field = UITextField()
        field.placeholder = "SeSAC@email.com"
        field.font = UIFont.NotoSans(.regular, size: 14)
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.keyboardType = .emailAddress

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
        label.text = "이메일을 입력해 주세요"
        label.textColor = UIColor.brandColor(.black)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()

    let secondLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.NotoSans(.regular, size: 16)
        label.textColor = UIColor.brandColor(.gray7)
        label.text = "(휴대폰 번호 변경 시 인증을 위해 사용해요)"
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

        [nextButton3, dividingLine, emailTextField, stackView].forEach {
            addSubview($0)
        }
    }

    private func setupConstraints() {
        stackView.snp.makeConstraints {
            $0.leading.equalTo(self).offset(57)
            $0.trailing.equalTo(self).offset(-57)
            $0.bottom.equalTo(emailTextField.snp.top).offset(-76)
            $0.height.equalTo(66)
        }

        emailTextField.snp.makeConstraints {
            $0.leading.equalTo(self).offset(28)
            $0.height.equalTo(22)
            $0.bottom.equalTo(dividingLine.snp.top).offset(-12)
        }

        dividingLine.snp.makeConstraints {
            $0.height.equalTo(1)
            $0.leading.equalTo(self).offset(16)
            $0.trailing.equalTo(self).offset(-16)
            $0.bottom.equalTo(nextButton3.snp.top).offset(-72)
        }

        nextButton3.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.leading.equalTo(self).offset(16)
            $0.trailing.equalTo(self).offset(-16)
            $0.bottom.equalTo(self).offset(-350)
            $0.height.equalTo(48)
        }

    }
}
