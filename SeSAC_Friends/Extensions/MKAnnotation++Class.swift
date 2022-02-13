//
//  MKAnnotation++Class.swift
//  SeSAC_Friends
//
//  Created by sungyeon kim on 2022/02/13.
//

import Foundation
import CoreLocation
import CoreLocationUI
import MapKit

class MyAnnotation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var tag: Int?
    var gender: Int?
    init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
    }
}
