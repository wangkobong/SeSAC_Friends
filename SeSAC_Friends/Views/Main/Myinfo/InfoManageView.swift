//
//  InfoManageView.swift
//  SeSAC_Friends
//
//  Created by sungyeon kim on 2022/01/26.
//

import UIKit
import SnapKit
import Then

class InfoManageView: UIView {

    let bgImageView = UIImageView().then {
        $0.image = UIImage(named: "sesac_bg_01")
        $0.layer.cornerRadius = 8
        $0.layer.masksToBounds = true
    }

    let tableView = UITableView().then {
        $0.register(TitleCell.self, forCellReuseIdentifier: TitleCell.reuseIdentifier)
        $0.register(HeaderCell.self, forCellReuseIdentifier: HeaderCell.reuseIdentifier)
        $0.register(PutCell.self, forCellReuseIdentifier: PutCell.reuseIdentifier)
        $0.backgroundColor = .red
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

        [bgImageView, tableView].forEach {
            addSubview($0)
        }

    }

    private func setupConstraints() {
        bgImageView.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide).offset(16)
            $0.leading.equalTo(self).offset(16)
            $0.trailing.equalTo(self).offset(-16)
            $0.height.equalTo(194)
        }

        tableView.snp.makeConstraints {
            $0.top.equalTo(bgImageView.snp.bottom).offset(16)
            $0.leading.equalTo(self).offset(16)
            $0.trailing.equalTo(self).offset(-16)
            $0.bottom.equalTo(self.safeAreaLayoutGuide)
        }

    }
}
