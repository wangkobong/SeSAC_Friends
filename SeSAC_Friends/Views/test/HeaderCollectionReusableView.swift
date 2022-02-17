//
//  HeaderCollectionReusableView.swift
//  SeSAC_Friends
//
//  Created by sungyeon kim on 2022/02/15.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {

    static let identifier = "HeaderCollectionReusableView"

    private let label: UILabel = {
       let label = UILabel()
        label.text = "header"
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()

    public func configure() {
        backgroundColor = .systemGreen
        addSubview(label)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = bounds
    }

}

class FooterCollectionReusableView: UICollectionReusableView {

    static let identifier = "FooterCollectionReusableView"

    private let label: UILabel = {
       let label = UILabel()
        label.text = "footer"
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()

    public func configure() {
        backgroundColor = .systemRed
        addSubview(label)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = bounds
    }

}
