//
//  PostHobbyView.swift
//  SeSAC_Friends
//
//  Created by sungyeon kim on 2022/02/14.
//

import UIKit
import SnapKit
import MapKit
import Then

class PostHobbyView: UIView {

    let collectionView = UICollectionView().then {
        $0.register(HobbyCollectionViewCell.self, forCellWithReuseIdentifier: HobbyCollectionViewCell.reuseIdentifier)
    }

    let FindHobbyButton = UIButton().then {
        $0.setTitle("새싹 찾기", for: .normal)
        $0.titleLabel?.font = UIFont.NotoSans(.regular, size: 14)
        $0.setTitleColor(UIColor.brandColor(.white), for: .normal)
        $0.setBackgroundColor(UIColor.brandColor(.green), for: .normal)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {

        [FindHobbyButton].forEach {
            addSubview($0)
        }
    }

    private func setupConstraints() {
        FindHobbyButton.snp.makeConstraints {
            $0.height.equalTo(48)
            $0.leading.equalTo(self).offset(16)
            $0.trailing.equalTo(self).offset(-16)
            $0.bottom.equalTo(self).offset(-16)
        }
    }
}
