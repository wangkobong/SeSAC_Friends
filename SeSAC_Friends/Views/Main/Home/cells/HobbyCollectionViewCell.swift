//
//  HobbyCollectionViewCell.swift
//  SeSAC_Friends
//
//  Created by sungyeon kim on 2022/02/14.
//

import UIKit

class HobbyCollectionViewCell: UICollectionViewCell {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()

    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    internal func setupView() {
        [].forEach {
            contentView.addSubview($0)
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        setupConstraints()
    }

    internal func setupConstraints() {

    }
}
