//
//  MapViewController.swift
//  quero_conhecer
//
//  Created by Convidado on 07/09/20.
//  Copyright © 2020 Convidado. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var viInfo: UIView!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbAdress: UILabel!
    
    var places: [Place]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadPlaces()
        searchBar.isHidden = true
        viInfo.isHidden = true
        mapView.delegate = self
        
        if places.count == 1 {
            title = places[0].name
        } else {
            title = "Meus lugares"
        }
        
        // Do any additional setup after loading the view.
    }
    
    private func loadPlaces(){
        for place in places {
            addToMap(place)
        }
        
        showPlaces()
    }
    
    private func showPlaces(){
        mapView.showAnnotations(mapView.annotations, animated: true)
    }
    
    private func addToMap(_ place: Place){
        let annotation   = PlaceAnnotation(coordinate: place.coordinate, type: .place)
        annotation.title = place.name
        annotation.coordinate = place.coordinate
        annotation.address = place.address
        mapView.addAnnotation(annotation)
        
    }

    @IBAction func showRoute(_ sender: UIButton) {
    }
    
    
    @IBAction func showSearchBar(_ sender: UIBarButtonItem) {
    }
}


extension MapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if !(annotation is PlaceAnnotation){
            return nil
        }
        
        let type = (annotation as! PlaceAnnotation).type
        let identifier = "\(type)"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKMarkerAnnotationView
        if annotationView == nil {
            annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
        }
        
        annotationView?.annotation = annotation
        annotationView?.canShowCallout = true
        annotationView?.markerTintColor =  type == .place ? UIColor(named: "main") : UIColor(named: "poi")
        annotationView?.glyphImage = type == .place ? UIImage(named: "placeGlyph") : UIImage(named: "poiGlyph")
        annotationView?.displayPriority = type == .place ? .required : .defaultHigh
        return annotationView
    }
}
