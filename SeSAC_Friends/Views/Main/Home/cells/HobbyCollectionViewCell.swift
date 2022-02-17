//
//  HobbyCollectionViewCell.swift
//  SeSAC_Friends
//
//  Created by sungyeon kim on 2022/02/14.
//

import UIKit
import SnapKit
import Then

class HobbyCollectionViewCell: UICollectionViewCell {

    let label = UILabel().then {
        $0.text = ""
        $0.textColor = UIColor.brandColor(.error)
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.brandColor(.error).cgColor
        $0.layer.cornerRadius = 4
        $0.layer.masksToBounds = true
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        [label].forEach {
            contentView.addSubview($0)
        }
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        setupConstraints()
    }

    internal func setupConstraints() {
        label.snp.makeConstraints {
            $0.height.equalTo(18)
        }
    }
}
