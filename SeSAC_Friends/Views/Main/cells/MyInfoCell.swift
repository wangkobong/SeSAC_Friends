//
//  MyInfoCell.swift
//  SeSAC_Friends
//
//  Created by sungyeon kim on 2022/01/25.
//

import UIKit
import SnapKit

class MyInfoCell: UITableViewCell {

    private let sesacImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "sesacFace"))
        imageView.contentMode = .scaleAspectFit
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.brandColor(.gray3).cgColor
        imageView.layer.cornerRadius = imageView.frame.size.width / 2
        imageView.layer.masksToBounds = true
        return imageView
    }()

    let nicknameLabel: UILabel = {
        let label = UILabel()
        label.text = "김새싹"
        label.font = UIFont.NotoSans(.regular, size: 16)
        label.textColor = UIColor.brandColor(.black)
        return label
    }()

    private let moreInfoImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "moreInfo"))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {

        [sesacImageView, nicknameLabel, moreInfoImageView].forEach {
            addSubview($0)
        }
    }

    private func setupConstraints() {
        sesacImageView.snp.makeConstraints {
            $0.width.equalTo(50)
            $0.height.equalTo(50)
            $0.top.equalTo(self).offset(20)
            $0.leading.equalTo(self).offset(15)
        }

        nicknameLabel.snp.makeConstraints {
            $0.height.equalTo(26)
            $0.leading.equalTo(sesacImageView.snp.trailing).offset(13)
            $0.bottom.equalTo(self).offset(-33)
        }

        moreInfoImageView.snp.makeConstraints {
            $0.width.equalTo(9)
            $0.height.equalTo(18)
            $0.trailing.equalTo(self).offset(-7.5)
            $0.bottom.equalTo(self).offset(-39)
        }
    }
}
