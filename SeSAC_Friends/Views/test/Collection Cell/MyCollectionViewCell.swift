//
//  MyCollectionViewCell.swift
//  SeSAC_Friends
//
//  Created by sungyeon kim on 2022/01/26.
//

import UIKit
import SnapKit
import Then

class MyCollectionViewCell: UICollectionViewCell {

    @IBOutlet var myLabel: UILabel!
    @IBOutlet var myImageView: UIImageView!

    static let identifier = "MyCollectionViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "MyCollectionViewCell", bundle: nil)
    }

    @IBOutlet var collectionView: UICollectionView!

    var models = [Model]()

    override func awakeFromNib() {
        super.awakeFromNib()

    }

    public func configure(with model: Model) {
        self.myLabel.text = model.text
        self.myImageView.image = UIImage(named: model.imageName)
    }

}
