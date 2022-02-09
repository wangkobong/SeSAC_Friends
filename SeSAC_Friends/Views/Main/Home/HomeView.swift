//
//  HomeView.swift
//  SeSAC_Friends
//
//  Created by sungyeon kim on 2022/01/25.
//

import UIKit
import SnapKit
import MapKit
import Then

class HomeView: UIView {
    let mapView: MKMapView = {
       let map = MKMapView()
        map.overrideUserInterfaceStyle = .light
        map.translatesAutoresizingMaskIntoConstraints = false
        return map
    }()

    let viewForStackView = UIView().then {
        $0.layer.cornerRadius = 8
        $0.layer.masksToBounds = true
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOpacity = 0.9
        $0.layer.shadowOffset = .zero
        $0.layer.shadowRadius = 10
        $0.backgroundColor = .red
    }

    let stackView = UIStackView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        $0.spacing = 0
        $0.distribution = .fillEqually
        $0.layer.shadowRadius = 10
        $0.layer.cornerRadius = 8
        $0.layer.shadowOpacity = 0.5
        $0.layer.masksToBounds = true
        $0.layer.shadowOffset = CGSize(width: 1, height: 1)
    }

    let bothButton = UIButton().then {
        $0.setTitle("전체", for: .normal)
        $0.titleLabel?.font = UIFont.NotoSans(.regular, size: 14)
        $0.setTitleColor(UIColor.brandColor(.white), for: .normal)
//        $0.setTitleColor(UIColor.brandColor(.white), for: .selected)
//        $0.setBackgroundColor(.systemBackground, for: .normal)
        $0.setBackgroundColor(UIColor.brandColor(.green), for: .normal)
    }

    let maleButton = UIButton().then {
        $0.setTitle("남자", for: .normal)
        $0.titleLabel?.font = UIFont.NotoSans(.regular, size: 14)
        $0.setTitleColor(UIColor.brandColor(.black), for: .normal)
        $0.setTitleColor(UIColor.brandColor(.white), for: .selected)
        $0.setBackgroundColor(.systemBackground, for: .normal)
        $0.setBackgroundColor(UIColor.brandColor(.green), for: .selected)
    }

    let femaleButton = UIButton().then {
        $0.setTitle("여자", for: .normal)
        $0.titleLabel?.font = UIFont.NotoSans(.regular, size: 14)
        $0.setTitleColor(UIColor.brandColor(.black), for: .normal)
        $0.setTitleColor(UIColor.brandColor(.white), for: .selected)
        $0.setBackgroundColor(.systemBackground, for: .normal)
        $0.setBackgroundColor(UIColor.brandColor(.green), for: .selected)
    }

    let myLocationButton = UIButton().then {
        $0.setImage(UIImage(named: "place"), for: .normal)
        $0.backgroundColor = .systemBackground
        $0.layer.cornerRadius = 8
        $0.layer.shadowColor = UIColor.label.cgColor
        $0.layer.shadowOpacity = 0.4
        $0.layer.shadowRadius = 10
    }

    let matchingButton = UIButton().then {
        $0.setImage(UIImage(named: "search_default"), for: .normal)
        $0.layer.cornerRadius = 30
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

        viewForStackView.addSubview(stackView)

        [bothButton, maleButton, femaleButton].forEach {
            stackView.addArrangedSubview($0)
        }

        [mapView, viewForStackView, stackView, myLocationButton, matchingButton].forEach {
            addSubview($0)
        }
    }

    private func setupConstraints() {

        mapView.snp.makeConstraints {
            $0.edges.equalTo(self.safeAreaLayoutGuide)
        }

        stackView.snp.makeConstraints {
            $0.height.equalTo(144)
            $0.width.equalTo(48)
            $0.leading.equalTo(self).offset(16)
            $0.top.equalTo(mapView.snp.top).offset(52)
        }

        viewForStackView.snp.makeConstraints {
            $0.height.equalTo(144)
            $0.width.equalTo(48)
            $0.leading.equalTo(self).offset(16)
            $0.top.equalTo(mapView.snp.top).offset(52)
        }

        myLocationButton.snp.makeConstraints {
            $0.width.equalTo(48)
            $0.height.equalTo(48)
            $0.leading.equalTo(self).offset(16)
            $0.top.equalTo(viewForStackView.snp.bottom).offset(16)
        }

        matchingButton.snp.makeConstraints {
            $0.width.equalTo(64)
            $0.height.equalTo(64)
            $0.trailing.equalTo(self).offset(-16)
            $0.bottom.equalTo(mapView.snp.bottom).offset(-16)
        }
    }
}
