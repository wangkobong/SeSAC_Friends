//
//  SubjectCollectionReusableView.swift
//  SeSAC_Friends
//
//  Created by sungyeon kim on 2022/02/15.
//

import UIKit

class SubjectCollectionReusableView: UICollectionReusableView {

    static let identifier = "SubjectCollectionReusableView"

    let label: UILabel = {
       let label = UILabel()
        label.textColor = .black
        label.font = UIFont.NotoSans(.regular, size: 12)
        return label
    }()

    public func configure() {
        backgroundColor = .systemBackground
        addSubview(label)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = bounds
    }
}
