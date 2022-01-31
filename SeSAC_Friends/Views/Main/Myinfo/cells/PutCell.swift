//
//  MyInfoCell.swift
//  SeSAC_Friends
//
//  Created by sungyeon kim on 2022/01/31.
//

import UIKit
import SnapKit
import Then
import RangeSeekSlider

class PutCell: UITableViewCell {

    var gender = 0
    var isOn = 0
    var ageMin = 0
    var ageMax = 0
    var user: User?

    let genderLabel = UILabel().then {
        $0.text = "내 성별"
        $0.font = UIFont.NotoSans(.regular, size: 14)
    }

    let femaleButton = UIButton().then {
        $0.setTitle("여자", for: .normal)
        $0.titleLabel?.font = UIFont.NotoSans(.regular, size: 14)
        $0.layer.cornerRadius = 4
        $0.layer.masksToBounds = true
    }

    let maleButton = UIButton().then {
        $0.setTitle("남자", for: .normal)
        $0.titleLabel?.font = UIFont.NotoSans(.regular, size: 14)
        $0.layer.cornerRadius = 4
        $0.layer.masksToBounds = true

    }

    let myHobbyLabel = UILabel().then {
        $0.text = "자주하는 취미"
        $0.font = UIFont.NotoSans(.regular, size: 14)
    }

    let dividingLine = UIView().then {
        $0.backgroundColor = UIColor.brandColor(.gray3)
    }

    let hobbyTextField = UITextField().then {
        $0.font = UIFont.NotoSans(.regular, size: 14)
        $0.placeholder = "취미"
    }

    let isPermittedLabel = UILabel().then {
        $0.text = "내 번호 검색 허용"
        $0.font = UIFont.NotoSans(.regular, size: 14)
    }

    let permitSwitch = UISwitch().then {
        $0.tintColor = UIColor.brandColor(.green)
    }

    let partnerAge = UILabel().then {
        $0.text = "상대방 연령대"
        $0.font = UIFont.NotoSans(.regular, size: 14)
    }

    let ageLabel = UILabel().then {
        $0.text = "18 - 35"
        $0.font = UIFont.NotoSans(.regular, size: 14)
        $0.textColor = UIColor.brandColor(.green)
    }

    let ageSlider = RangeSeekSlider().then {
//        $0.minValue = 18
//        $0.maxValue = 65
        $0.handleColor = UIColor.brandColor(.green)
        $0.handleBorderColor = UIColor.brandColor(.white)
        $0.colorBetweenHandles = UIColor.brandColor(.green)
        $0.tintColor = UIColor.brandColor(.gray3)
        $0.lineHeight = 5
        $0.handleDiameter = 20.0
        $0.hideLabels = true
        $0.handleBorderWidth = 1

    }

    let withdrawButton = UIButton().then {
        $0.setTitle("탈퇴하기", for: .normal)
        $0.backgroundColor = .systemBackground
        $0.setTitleColor(UIColor.brandColor(.black), for: .normal)
        $0.titleLabel?.font = UIFont.NotoSans(.regular, size: 14)
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupConstraints()

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func load(user: User) {
        print(#function)
        self.user = user
        guard let currentUser = self.user else { return }
        self.isOn = currentUser.searchable
        self.gender = currentUser.gender
        self.ageMax = currentUser.ageMax
        self.ageMin = currentUser.ageMin
        setGender()
        setSwitch()
        setAge()
    }

    func setGender() {
        if gender == -1 {
            [femaleButton, maleButton].forEach {
                $0.backgroundColor = .systemBackground
                $0.setTitleColor(UIColor.brandColor(.black), for: .normal)
            }
        } else if gender == 0 {
            femaleButton.backgroundColor = UIColor.brandColor(.green)
            femaleButton.setTitleColor(UIColor.brandColor(.white), for: .normal)
            maleButton.backgroundColor = .systemBackground
            maleButton.setTitleColor(UIColor.brandColor(.black), for: .normal)
            maleButton.layer.borderWidth = 1
            maleButton.layer.borderColor = UIColor.brandColor(.gray3).cgColor
        } else {
            femaleButton.backgroundColor = .systemBackground
            femaleButton.setTitleColor(UIColor.brandColor(.black), for: .normal)
            femaleButton.layer.borderWidth = 1
            femaleButton.layer.borderColor = UIColor.brandColor(.gray3).cgColor
            maleButton.backgroundColor = UIColor.brandColor(.green)
            maleButton.setTitleColor(UIColor.brandColor(.white), for: .normal)
        }
    }

    func setSwitch() {
        if isOn == 1 {
            permitSwitch.isOn = true
        } else {
            permitSwitch.isOn = false
        }
    }

    func setAge() {
        ageLabel.text = "\(ageMin) - \(ageMax)"
        ageSlider.minValue = CGFloat(ageMin )
        ageSlider.maxValue = CGFloat(ageMax )
    }

    func test() {
        print(#function)
    }

    internal func setupView() {

        [genderLabel, myHobbyLabel, isPermittedLabel, partnerAge, maleButton, femaleButton, dividingLine, hobbyTextField, permitSwitch, ageLabel, ageSlider, withdrawButton].forEach {
            contentView.addSubview($0)
        }

    }

    internal func setupConstraints() {

        genderLabel.snp.makeConstraints {
            $0.top.equalTo(self).offset(37)
            $0.leading.equalTo(self)
        }

        myHobbyLabel.snp.makeConstraints {
            $0.top.equalTo(genderLabel.snp.bottom).offset(42)
            $0.leading.equalTo(self)
        }

        isPermittedLabel.snp.makeConstraints {
            $0.top.equalTo(myHobbyLabel.snp.bottom).offset(42)
            $0.leading.equalTo(self)
        }

        partnerAge.snp.makeConstraints {
            $0.top.equalTo(isPermittedLabel.snp.bottom).offset(42)
            $0.leading.equalTo(self)
        }

        femaleButton.snp.makeConstraints {
            $0.top.equalTo(self).offset(24)
            $0.trailing.equalTo(self)
            $0.width.equalTo(56)
            $0.height.equalTo(48)
        }

        maleButton.snp.makeConstraints {
            $0.top.equalTo(self).offset(24)
            $0.trailing.equalTo(femaleButton.snp.leading).offset(-8)
            $0.width.equalTo(56)
            $0.height.equalTo(48)
        }

        dividingLine.snp.makeConstraints {
            $0.top.equalTo(myHobbyLabel.snp.bottom).offset(12)
            $0.trailing.equalTo(self)
            $0.width.equalTo(164)
            $0.height.equalTo(1)
        }

        hobbyTextField.snp.makeConstraints {
            $0.bottom.equalTo(dividingLine.snp.top).offset(-12)
            $0.trailing.equalTo(self).offset(-129)

        }

        permitSwitch.snp.makeConstraints {
            $0.top.equalTo(dividingLine.snp.bottom).offset(26)
            $0.trailing.equalTo(self).offset(-2)
        }

        ageLabel.snp.makeConstraints {
            $0.trailing.equalTo(self)
            $0.top.equalTo(permitSwitch.snp.bottom).offset(37)
        }

        ageSlider.snp.makeConstraints {
            $0.leading.equalTo(self)
            $0.trailing.equalTo(self)
            $0.top.equalTo(ageLabel.snp.bottom)
        }

        withdrawButton.snp.makeConstraints {
            $0.top.equalTo(ageSlider.snp.bottom).offset(20)
            $0.leading.equalTo(self)
            $0.height.equalTo(22)
        }

    }
}
