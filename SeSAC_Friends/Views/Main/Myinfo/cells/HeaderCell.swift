//
//  TitleCell.swift
//  SeSAC_Friends
//
//  Created by sungyeon kim on 2022/01/27.
//

import UIKit
import SnapKit
import Then

class HeaderCell: UITableViewCell {

    let nicknameLabel = UILabel().then {
        $0.text = "김새싹"
    }

    let toggleImage = UIImageView().then {
        $0.image = UIImage(named: "toggleOff")
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupConstraints()

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    internal func setupView() {

        [nicknameLabel, toggleImage].forEach {
            contentView.addSubview($0)
        }
    }

    internal func setupConstraints() {

        nicknameLabel.snp.makeConstraints {
            $0.top.equalTo(self).offset(16)
            $0.leading.equalTo(self).offset(16)
            $0.bottom.equalTo(self).offset(-16)
        }

        toggleImage.snp.makeConstraints {
            $0.trailing.equalTo(self).offset(-26)
            $0.top.equalTo(self).offset(26)
            $0.bottom.equalTo(self).offset(-26)
            $0.width.equalTo(12)
            $0.height.equalTo(6)
        }

    }
}
