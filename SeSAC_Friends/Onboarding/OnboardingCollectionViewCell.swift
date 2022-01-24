//
//  OnboardingCollectionViewCell.swift
//  SeSAC_Friends
//
//  Created by sungyeon kim on 2022/01/23.
//

import UIKit
import SnapKit

class OnboardingCollectionViewCell: UICollectionViewCell {

    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "위치 기반으로 빠르게 주위 친구를 확인"
        label.textColor = .black
        label.font = UIFont.NotoSans(.regular, size: 24)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
//        setupView()
//        setupConstraints()
    }

    internal func setupView() {
        [descriptionLabel, imageView].forEach {
            contentView.addSubview($0)
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        setupConstraints()
    }

    internal func setupConstraints() {

        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(self)
            $0.leading.equalTo(self).offset(85)
            $0.trailing.equalTo(self).offset(-85)
//            $0.width.equalTo(205)
            $0.bottom.equalTo(imageView.snp.top).offset(-56)
        }

        imageView.snp.makeConstraints {
            $0.leading.equalTo(self)
            $0.trailing.equalTo(self)
            $0.bottom.equalTo(self)
            $0.height.equalTo(360)
        }
    }

    func setup(_ slide: OnboardingSlide) {
        imageView.image = slide.image
        descriptionLabel.text = slide.description
    }
}
