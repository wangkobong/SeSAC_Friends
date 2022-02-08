//
//  TestViewController.swift
//  SeSAC_Friends
//
//  Created by sungyeon kim on 2022/01/25.
//

import UIKit
import CoreLocation
import CoreLocationUI
import MapKit

class HomeViewController: UIViewController {

    let homeView = HomeView()
    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "친구찾기"

        homeView.mapView.delegate = self
        locationManager.delegate = self
        
   
    }

    override func loadView() {
        view = homeView
    }

}

extension HomeViewController: CLLocationManagerDelegate, MKMapViewDelegate {
    setregion
}
