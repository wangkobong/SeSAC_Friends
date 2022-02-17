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

    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(HobbyCollectionViewCell.self, forCellWithReuseIdentifier: HobbyCollectionViewCell.reuseIdentifier)
        collectionView.register(SubjectCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SubjectCollectionReusableView.identifier)
        collectionView.backgroundColor = .systemYellow

        return collectionView
    }()

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

        [FindHobbyButton, collectionView].forEach {
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

        collectionView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(32)
            $0.leading.equalTo(self).offset(16)
            $0.trailing.equalTo(self).offset(-16)
            $0.bottom.equalTo(FindHobbyButton.snp.top).offset(-10)
        }
    }
}
