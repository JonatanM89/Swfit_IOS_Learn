//
//  Place.swift
//  quero_conhecer
//
//  Created by Convidado on 07/09/20.
//  Copyright © 2020 Convidado. All rights reserved.
//

import Foundation
import MapKit

struct Place: Decodable, Encodable {
    let name: String
    let latitude: CLLocationDegrees
    let longitute: CLLocationDegrees
    let address: String
    
    var coordinate: CLLocationCoordinate2D{
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitute)
    }
    
    static func getFormatterAddress(with placeMark: CLPlacemark) -> String {
        var address = ""
        if let street = placeMark.thoroughfare{
            address += street
        }
        
        if let number = placeMark.subThoroughfare{
            address += " \(number)"
        }
        
        if let neighborhood = placeMark.subLocality{
            address += ", \(neighborhood)"
        }
        
        if let city = placeMark.locality {
            address += " \n\(city)"
        }
        
        if let state = placeMark.administrativeArea {
            address += " - \(state)"
        }
        
        if let cep = placeMark.postalCode {
            address += " \nCEP: \(cep)"
        }
        
        if let country = placeMark.country {
            address += " \n\(country)"
        }
        
        return address
    }
}

extension Place: Equatable{
    static func == (lhs: Place, rsh: Place) -> Bool {
        return lhs.latitude == rsh.latitude && lhs.longitute == rsh.longitute
    }
}
