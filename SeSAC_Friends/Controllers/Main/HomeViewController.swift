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
    var centerAnnotation = MKPointAnnotation()
    var currentCenterCoordinate: CLLocationCoordinate2D?

    override func loadView() {
        view = homeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "친구찾기"
        let mapView = homeView.mapView
        homeView.mapView.delegate = self
        locationManager.delegate = self

        locationManager.startUpdatingLocation()
        locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
        locationManager.distanceFilter = 10.0
        locationManager.requestAlwaysAuthorization()
        mapView.showsUserLocation = true
        homeView.myLocationButton.addTarget(self, action: #selector(didTapMyLocation), for: .touchUpInside)
    }

    @objc private func didTapMyLocation() {
        print(#function)
        guard let currentLocation = locationManager.location else {
            return
        }
        let mapView = homeView.mapView
        mapView.showsUserLocation = true
        mapView.setUserTrackingMode(.follow, animated: true)

    }

}

extension HomeViewController: CLLocationManagerDelegate, MKMapViewDelegate {

    // 9. iOS 버전에 따른 분기 처리와 iOS 위치 서비스 여부 확인
    func checkUserLocationServiceAuthorization() {

        let authorizationStatus: CLAuthorizationStatus

        if #available(iOS 14.0, *) {
            authorizationStatus = locationManager.authorizationStatus // iOS14 이상
        } else {
            authorizationStatus = CLLocationManager.authorizationStatus() // iOS14 미만
        }

        // iOS 위치 서비스 확인
        if CLLocationManager.locationServicesEnabled() {
            // 권한상태 확인 및 권한 요청 가능(8번 메서드 실행)
            checkCurrentLocationAuthorization(authorizationStatus)
        } else {
            print("iOS 위치 서비스를 켜주세요")
        }

    }

    // 8. 사용자의 권한 상태 확인(UDF 사용자 정의 함수로 프로토콜, 내 메서드가 아님)
    // 사용자가 위치를 허용했는지 안했는지 거부했는지 이런 권한을 확인하는 메서드 (단, iOS 위치 서비스가 가능한 지 확인)
    func checkCurrentLocationAuthorization(_ authorizationStatus: CLAuthorizationStatus) {
        switch authorizationStatus {
        case .notDetermined:
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestWhenInUseAuthorization() // 앱을 사용하는 동안에 대한 위치 권한 요청
            locationManager.startUpdatingLocation() // 위치 접근 시작
        case .restricted, .denied:
            print("DENIED, 설정으로 유도")
        case .authorizedAlways:
            print("Always")
        case .authorizedWhenInUse:
            locationManager.startUpdatingLocation() // 위치 접근 시작! => didUpdateLocations 실행
        @unknown default:
            print("DEFAULT")
        }

        if #available(iOS 14.0, *) {
            // 정확도 체크: 정확도가 감소가 되어 있을 경우, 1시간 4번, 미리 알림, 배터리 오래 쓸수 있음.
            let accurancyState = locationManager.accuracyAuthorization

            switch accurancyState {
            case .fullAccuracy:
                print("FULL")
            case .reducedAccuracy:
                print("REDUCE")
            @unknown default:
                print("DEFAULT")
            }
        }
    }

    // 4. 사용자가 위치 허용을 한 경우
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(#function)
        print("mylocation: \(locations)")
        let mapView = homeView.mapView
        if let coordinate = locations.last?.coordinate {

            let annotation = MKPointAnnotation()
            annotation.title = "CURRENT LOCATION"
            annotation.coordinate = coordinate
            mapView.addAnnotation(annotation)

            let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
            let region = MKCoordinateRegion(center: coordinate, span: span)
            mapView.setRegion(region, animated: true)

            // 10. (중요)
//            locationManager.startUpdatingLocation()
        } else {
            print("Location Cannot Find")
        }
    }

    // 5. 위치 접근이 실패했을 경우
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(#function)
        print("error: \(error)")
    }

    // 6. iOS14 미만: 앱이 위치 관리자를 생성하고, 승인 상태가 변경이 될 때 대리자에게 승인 상태를 알려줌.
    // 권한이 변경될 때 감지해서 실행이 됨.
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print(#function)
        checkUserLocationServiceAuthorization()
    }

    // 7. iOS14 이상: 앱이 위치 관리자를 생성하고, 승인 상태가 변경이 될 때 대리자에게 승인 상태를 알려줌.
    // 권한이 변경될 때 감지해서 실행이 됨.
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        print(#function)
        checkUserLocationServiceAuthorization()
    }

    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        print(#function)

        let annotation = MKPointAnnotation()
        let currentCoordinate = mapView.centerCoordinate
        self.currentCenterCoordinate = currentCoordinate
        print("현재 좌표: \(currentCenterCoordinate)")
        let annotations = mapView.annotations
        mapView.removeAnnotations(annotations)
        annotation.title = "center of map"
        annotation.coordinate = mapView.centerCoordinate
        mapView.addAnnotation(annotation)
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let region = MKCoordinateRegion(center: mapView.centerCoordinate, span: span)
        mapView.setRegion(region, animated: true)
    }

}
