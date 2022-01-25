//
//  HomeView.swift
//  SeSAC_Friends
//
//  Created by sungyeon kim on 2022/01/25.
//

import UIKit

class HomeView: UIView {
    let button3: UIButton = {
         let button = UIButton()
         button.backgroundColor = UIColor(named: "BrandGray6")
         button.setTitle("탈퇴", for: .normal)
         button.setTitleColor(UIColor(named: "BrandGray3"), for: .normal)
         button.layer.cornerRadius = 8
         button.layer.masksToBounds = true
         return button
     }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {

        [button3].forEach {
            addSubview($0)
        }
    }

    private func setupConstraints() {

        button3.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalTo(200)
            $0.height.equalTo(300)
        }
    }
}
