//
//  HomeView.swift
//  SeSAC_Friends
//
//  Created by sungyeon kim on 2022/01/25.
//

import UIKit
import SnapKit
import MapKit

class HomeView: UIView {
    let mapView: MKMapView = {
       let map = MKMapView()
        map.overrideUserInterfaceStyle = .light
        map.translatesAutoresizingMaskIntoConstraints = false
        return map
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

        [mapView].forEach {
            addSubview($0)
        }
    }

    private func setupConstraints() {

        mapView.snp.makeConstraints {
            $0.edges.equalTo(self.safeAreaLayoutGuide)
        }
    }
}
