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
    var users: [Queue]?
    var userForFiltering: Queue?
    // 0: 여자, 1: 남자
    var filteringGenderNumber: Int = -1 {
        didSet {
            print("genderNumber는 \(oldValue) 에서 \(filteringGenderNumber)로 변경됨")
            filterAnnotations(genderNumber: filteringGenderNumber)
        }
    }

    override func loadView() {
        view = homeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print(UserDefaults.standard.string(forKey: K.idToken))
        view.backgroundColor = .systemBackground
        title = "친구찾기"
        let mapView = homeView.mapView
        homeView.mapView.delegate = self
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()

        homeView.myLocationButton.addTarget(self, action: #selector(didTapMyLocation), for: .touchUpInside)
        // 뷰디드로드에 셋리젼
        setMyLocation(mapView)
        homeView.bothButton.isSelected = true
        homeView.bothButton.addTarget(self, action: #selector(didTapAll(_:)), for: .touchUpInside)
        homeView.maleButton.addTarget(self, action: #selector(didTapMale(_:)), for: .touchUpInside)
        homeView.femaleButton.addTarget(self, action: #selector(didTapFemale(_:)), for: .touchUpInside)
        homeView.matchingButton.addTarget(self, action: #selector(didTapMatching), for: .touchUpInside)
    }

    func setMyLocation(_ mapView: MKMapView) {
        let coor = locationManager.location?.coordinate
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.1)
        let region = MKCoordinateRegion(center: coor!, span: span)
        mapView.setRegion(region, animated: true)
    }

    private func setButtonStatus(sender: UIButton) {
        sender.isSelected = true
        if sender.titleLabel?.text == "전체" {
            homeView.maleButton.isSelected = false
            homeView.femaleButton.isSelected = false
        } else if sender.titleLabel?.text == "남자" {
            homeView.bothButton.isSelected = false
            homeView.femaleButton.isSelected = false
        } else {
            homeView.bothButton.isSelected = false
            homeView.maleButton.isSelected = false
        }
    }

    private func filterAnnotations(genderNumber: Int) {
        let annotations = homeView.mapView.annotations.filter({ !($0 is MKUserLocation) })
        homeView.mapView.removeAnnotations(annotations)
        addAnnotationsOnMap(locationsInfo: userForFiltering!, genderNumber: filteringGenderNumber)
    }

    func addAnnotationsOnMap(locationsInfo: Queue, genderNumber: Int) {

        let mapView = homeView.mapView
        var annotations = mapView.annotations
        var filteredAnnotations = [MyAnnotation]()
        annotations.removeAll()
        locationsInfo.fromQueueDB.forEach {
            let coordinate = CLLocationCoordinate2D(latitude: $0.lat, longitude: $0.long)
            let annotation = MyAnnotation(coordinate: coordinate)
            annotation.coordinate = coordinate
            annotation.tag = $0.sesac
            annotation.gender = $0.gender
            annotations.append(annotation)
            if genderNumber == -1 {
                filteredAnnotations = annotations as! [MyAnnotation]
            } else if genderNumber == 0 {
                let myAnnotations = annotations as! [MyAnnotation]
                filteredAnnotations = myAnnotations.filter { $0.gender == 0}
            } else {
                let myAnnotations = annotations as! [MyAnnotation]
                filteredAnnotations = myAnnotations.filter { $0.gender == 1}
            }

            print("------------------------")
            print("닉네임: \($0.nick)")
            print("lat: \($0.lat)")
            print("long: \($0.long)")
            print("이미지번호: \($0.sesac)")
            print("성별: \($0.gender)")
        }
        mapView.addAnnotations(filteredAnnotations)
    }

    @objc private func didTapMyLocation() {
        let mapView = homeView.mapView
        setMyLocation(mapView)
    }

    @objc private func didTapAll(_ sender: UIButton) {
        setButtonStatus(sender: sender)
        filteringGenderNumber = -1

    }

    @objc private func didTapMale(_ sender: UIButton) {
        setButtonStatus(sender: sender)
        filteringGenderNumber = 1
    }

    @objc private func didTapFemale(_ sender: UIButton) {
        setButtonStatus(sender: sender)
        filteringGenderNumber = 0
    }

    @objc private func didTapMatching() {
        let vc = PostHobbyViewController()
        navigationItem.backButtonTitle = ""
        self.navigationController?.pushViewController(vc, animated: true)
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
        let coordinate = CLLocationCoordinate2DMake(mapView.region.center.latitude, mapView.region.center.longitude)
        var span = mapView.region.span
        if span.latitudeDelta < 0.002 { // MIN LEVEL
         span = MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002)
        } else if span.latitudeDelta > 0.3 { // MAX LEVEL
         span = MKCoordinateSpan(latitudeDelta: 0.3, longitudeDelta: 0.3)
        }
        let region = MKCoordinateRegion(center: coordinate, span: span)
        mapView.setRegion(region, animated: true)

        let lat = Double(coordinate.latitude)
        let long = Double(coordinate.longitude)
        guard let regionResult = Int(QueueManager.getRegion(lat: lat, long: long)) else { return }

        QueueManager.onqueue(lat: lat, long: long, region: regionResult) { otherUsers, statusCode in
            guard let otherUsers = otherUsers else {
                print("onqueue 실패: \(statusCode)")
                return
            }
            self.userForFiltering = otherUsers
            self.addAnnotationsOnMap(locationsInfo: otherUsers, genderNumber: self.filteringGenderNumber)
        }
    }

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {

        if annotation is MKUserLocation {
            return nil
        }
        guard let annotation = annotation as? MyAnnotation else { return nil }
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "custom")

        if annotationView == nil {
            // CREATE VIEW
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "custom")
        } else {
            // ASSIGN ANNOTATION
            annotationView?.annotation = annotation
        }
        var pinImage = UIImage(named: "sesac_face_1")
        // SET CUSTOM ANNOTATION IMAGES
        switch annotation.tag {
        case 0:
            pinImage = UIImage(named: "sesac_face_1")
        case 1:
            pinImage = UIImage(named: "sesac_face_2")
        case 2:
            pinImage = UIImage(named: "sesac_face_3")
        case 3:
            pinImage = UIImage(named: "sesac_face_4")
        case 4:
            pinImage = UIImage(named: "sesac_face_5")
        default:
            annotationView?.image = UIImage(named: "search_face_0")
        }
        let size = CGSize(width: 80, height: 80)

        UIGraphicsBeginImageContext(size)
        pinImage!.draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        annotationView?.image = resizedImage

        return annotationView
    }

}
