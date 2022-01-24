//
//  UICollectionViewCell++Extension.swift
//  SeSAC_Friends
//
//  Created by sungyeon kim on 2022/01/24.
//

import UIKit

protocol ReusableView {
    static var reuseIdentifier: String { get }
}

extension UICollectionViewCell: ReusableView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
