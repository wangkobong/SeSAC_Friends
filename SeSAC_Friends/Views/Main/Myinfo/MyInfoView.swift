//
//  MyInfoView.swift
//  SeSAC_Friends
//
//  Created by sungyeon kim on 2022/01/25.
//

import UIKit
import SnapKit

class MyInfoView: UIView {

    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(MyInfoCell.self, forCellReuseIdentifier: MyInfoCell.reuseIdentifier)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        return tableView
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

        [tableView].forEach {
            addSubview($0)
        }
    }

    private func setupConstraints() {
        tableView.snp.makeConstraints {
            $0.edges.equalTo(self.safeAreaLayoutGuide)
        }
    }
}
