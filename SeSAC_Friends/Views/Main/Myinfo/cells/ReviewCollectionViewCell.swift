//
//  CollectionViewCell.swift
//  SeSAC_Friends
//
//  Created by sungyeon kim on 2022/01/26.
//

import UIKit
import SnapKit
import Then

class ReviewCollectionViewCell: UICollectionViewCell {

    let button1 = UIButton().then {
        $0.titleLabel?.text = "좋은매너"
        $0.setTitleColor(UIColor.brandColor(.white), for: .normal)
        $0.layer.cornerRadius = 8
        $0.layer.masksToBounds = true
        $0.backgroundColor = .green
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
        button1.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)

    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    internal func setupView() {
        [button1].forEach {
            contentView.addSubview($0)

        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        setupConstraints()
    }

    internal func setupConstraints() {

        button1.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

    }
    @objc func didTapButton(_ sender: UIButton) {
        if sender.backgroundColor != UIColor.brandColor(.green) {
            sender.backgroundColor = UIColor.brandColor(.green)
            sender.setTitleColor(UIColor.brandColor(.white), for: .normal)
        } else {
            sender.backgroundColor = UIColor.brandColor(.white)
            sender.setTitleColor(UIColor.brandColor(.black), for: .normal)
            sender.layer.borderWidth = 1
            sender.layer.borderColor = UIColor.brandColor(.gray3).cgColor
        }
        print(sender.titleLabel?.text ?? "")
    }

    public func test(with button: Buttons) {
        self.button1.setTitle(button.buttonTitle, for: .normal)
        self.button1.backgroundColor = button.bgColor
    }

}
