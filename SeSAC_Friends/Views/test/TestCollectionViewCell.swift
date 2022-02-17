//
//  TestCollectionViewCell.swift
//  SeSAC_Friends
//
//  Created by sungyeon kim on 2022/02/15.
//

import UIKit

class TestCollectionViewCell: UICollectionViewCell {

    static let identifier = "TestCollectionViewCell"

    static func nib() -> UINib {
        return UINib(nibName: "TestCollectionViewCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .link
    }

}
