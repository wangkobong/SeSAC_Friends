//
//  CollectionReusableView.swift
//  SeSAC_Friends
//
//  Created by sungyeon kim on 2022/01/27.
//

import UIKit
import SnapKit
import Then

class SectionHeader: UICollectionReusableView {
    let titleLabel = UILabel().then {
        $0.text = "sdfsdfsdf"
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true

   }

   required init?(coder aDecoder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
   }
}
