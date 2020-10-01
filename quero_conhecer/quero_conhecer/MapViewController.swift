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
        let annotation   = MKPointAnnotation()
        annotation.title = place.name
        annotation.coordinate = place.coordinate
        mapView.addAnnotation(annotation)
        
    }

    @IBAction func showRoute(_ sender: UIButton) {
    }
    
    
    @IBAction func showSearchBar(_ sender: UIBarButtonItem) {
    }
}
