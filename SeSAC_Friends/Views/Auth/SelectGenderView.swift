//
//  SelectGenderView.swift
//  SeSAC_Friends
//
//  Created by sungyeon kim on 2022/01/22.
//

import UIKit
import SnapKit

class SelectGenderView: UIView {
    let nextButton4: UIButton = {
         let button = UIButton()
         button.backgroundColor = UIColor(named: "BrandGray6")
         button.setTitle("다음", for: .normal)
         button.setTitleColor(UIColor(named: "BrandGray3"), for: .normal)
         button.layer.cornerRadius = 8
         button.layer.masksToBounds = true
        button.isEnabled = false
         return button
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
        label.text = "성별을 선택해주세요"
        label.textColor = UIColor.brandColor(.black)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()

    let secondLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.NotoSans(.regular, size: 16)
        label.textColor = UIColor.brandColor(.gray7)
        label.text = "새싹 찾기 기능을 이용하기 위해서 필요해요"
        label.textAlignment = .center
        return label
    }()

    let maleButton: UIButton = {
        var configuration = UIButton.Configuration.plain()
        configuration.titleAlignment = .center
        configuration.imagePlacement = .top
        let button = UIButton(configuration: configuration, primaryAction: nil)
        button.setTitle("남자", for: .normal)
        button.setImage(UIImage(named: "man"), for: .normal)
        button.setTitleColor(UIColor.brandColor(.black), for: .normal)
        button.titleLabel?.font = UIFont.NotoSans(.regular, size: 16)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.brandColor(.gray3).cgColor
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        button.tag = 1
        return button
    }()

    let femaleButton: UIButton = {
        var configuration = UIButton.Configuration.plain()
        configuration.titleAlignment = .center
        configuration.imagePlacement = .top
        let button = UIButton(configuration: configuration, primaryAction: nil)
        button.setTitle("여자", for: .normal)
        button.setImage(UIImage(named: "woman"), for: .normal)
        button.setTitleColor(UIColor.brandColor(.black), for: .normal)
        button.titleLabel?.font = UIFont.NotoSans(.regular, size: 16)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.brandColor(.gray3).cgColor
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        button.tag = 0
        return button
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

        [nextButton4, stackView, maleButton, femaleButton].forEach {
            addSubview($0)
        }
    }

    private func setupConstraints() {
        stackView.snp.makeConstraints {
            $0.leading.equalTo(self).offset(57)
            $0.trailing.equalTo(self).offset(-57)
            $0.bottom.equalTo(maleButton.snp.top).offset(-32)
            $0.height.equalTo(66)
        }

        nextButton4.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.leading.equalTo(self).offset(16)
            $0.trailing.equalTo(self).offset(-16)
            $0.bottom.equalTo(self).offset(-350)
            $0.height.equalTo(48)
        }

        maleButton.snp.makeConstraints {
            $0.bottom.equalTo(nextButton4.snp.top).offset(-32)
            $0.leading.equalTo(self).offset(16)
            $0.width.equalToSuperview().multipliedBy(0.45)
            $0.height.equalTo(120)
        }

        femaleButton.snp.makeConstraints {
            $0.bottom.equalTo(nextButton4.snp.top).offset(-32)
            $0.trailing.equalTo(self).offset(-15)
            $0.width.equalToSuperview().multipliedBy(0.45)
            $0.height.equalTo(120)
        }

    }

    func loadViewFromNib(nib: String) -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nib, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
}
