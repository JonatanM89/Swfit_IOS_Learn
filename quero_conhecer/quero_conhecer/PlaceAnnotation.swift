//
//  PlaceAnnotation.swift
//  quero_conhecer
//
//  Created by Convidado on 01/10/20.
//  Copyright © 2020 Convidado. All rights reserved.
//

import Foundation
import MapKit

enum PlaceType {
    case place
    case poi
}

class PlaceAnnotation : NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    var type: PlaceType
    var address: String?
    
    init(coordinate: CLLocationCoordinate2D, type: PlaceType){
        self.coordinate = coordinate
        self.type = type
    }
    
    
}
