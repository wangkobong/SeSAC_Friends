//
//  WithdrawAlertView.swift
//  SeSAC_Friends
//
//  Created by sungyeon kim on 2022/01/31.
//

import UIKit
import Then
import SnapKit

class WithdrawAlertView: UIView {

    let alertView = UIView().then {
        $0.layer.cornerRadius = 8
        $0.layer.masksToBounds = true
        $0.backgroundColor = UIColor.brandColor(.white)
    }

    let askLabel = UILabel().then {
        $0.font = UIFont.NotoSans(.medium, size: 16)
        $0.text = "정말 탈퇴하시겠습니까?"
        $0.textAlignment = .center
    }

    let descriptionLabel = UILabel().then {
        $0.font = UIFont.NotoSans(.regular, size: 14)
        $0.text = "탈퇴하시면 새싹 프렌즈를 이용할 수 없어요"
        $0.textAlignment = .center
    }

    let buttonStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 8
        $0.distribution = .fillEqually
    }

    let cancelButton = UIButton().then {
        $0.setTitle("취소", for: .normal)
        $0.setTitleColor(UIColor.brandColor(.black), for: .normal)
        $0.titleLabel?.font = UIFont.NotoSans(.regular, size: 14)
        $0.backgroundColor = UIColor.brandColor(.gray2)
        $0.layer.cornerRadius = 8
        $0.layer.masksToBounds = true
    }

    let okButton = UIButton().then {
        $0.setTitle("확인", for: .normal)
        $0.setTitleColor(UIColor.brandColor(.white), for: .normal)
        $0.titleLabel?.font = UIFont.NotoSans(.regular, size: 14)
        $0.backgroundColor = UIColor.brandColor(.green)
        $0.layer.cornerRadius = 8
        $0.layer.masksToBounds = true
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        [cancelButton, okButton].forEach {
            buttonStackView.addArrangedSubview($0)
        }

        [askLabel, descriptionLabel, buttonStackView].forEach {
            alertView.addSubview($0)
        }

        [alertView].forEach {
            addSubview($0)
        }
    }

    private func setupConstraints() {
        alertView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.height.equalTo(156)
            $0.leading.equalTo(self).offset(16)
            $0.trailing.equalTo(self).offset(-15)
        }

        askLabel.snp.makeConstraints {
            $0.top.equalTo(alertView.snp.top).offset(16)
            $0.leading.equalTo(alertView.snp.leading).offset(16)
            $0.trailing.equalTo(alertView.snp.trailing).offset(-16)
            $0.height.equalTo(30)
        }

        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(askLabel.snp.bottom).offset(8)
            $0.leading.equalTo(alertView.snp.leading).offset(16)
            $0.trailing.equalTo(alertView.snp.trailing).offset(-16)
            $0.height.equalTo(22)
        }

        buttonStackView.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(16)
            $0.leading.equalTo(alertView.snp.leading).offset(16)
            $0.trailing.equalTo(alertView.snp.trailing).offset(-16)
            $0.bottom.equalTo(alertView.snp.bottom).offset(-16)
        }
    }
}
