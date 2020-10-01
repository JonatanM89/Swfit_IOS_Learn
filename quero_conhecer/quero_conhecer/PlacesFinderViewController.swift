//
//  PlacesFinderViewController.swift
//  quero_conhecer
//
//  Created by Convidado on 30/08/20.
//  Copyright © 2020 Convidado. All rights reserved.
//

import UIKit
import MapKit

protocol PlaceFinderDelegate: class {
    func addPlace(_ place: Place)
}

class PlacesFinderViewController: UIViewController {
   
    enum  PlaceFinderMessageType {
        case error (String)
        case confirmation (String)
        
    }

    @IBOutlet weak var tfCity: UITextField!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var activeIndicatorLoading: UIActivityIndicatorView!
    @IBOutlet weak var viLoading: UIView!
    var place: Place!
    weak var delegate: PlaceFinderDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gesture = UILongPressGestureRecognizer(target: self, action: #selector(getLocation(_:)))
        gesture.minimumPressDuration = 2.0
        mapView.addGestureRecognizer(gesture)
    }
    
    
    @objc func  getLocation(_ gesture:UILongPressGestureRecognizer){
        if gesture.state == .began {
            load(show: true)
            let point = gesture.location(in: mapView)
            let coordinate = mapView.convert(point, toCoordinateFrom: mapView)
            let location  = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
            CLGeocoder().reverseGeocodeLocation(location) { (placemarkers, error) in
                self.load(show: false)
                
                if error == nil {
                    if !self.savePlace(with: placemarkers?.first) {
                        self.showMessage(type: .error("Não foi encontrado nenhum local!"))
                    }
                } else {
                    self.showMessage(type: .error("Erro desconhecido"))
                }
            }
        }
    }
    
    @IBAction func findCity(_ sender: Any) {
        tfCity.resignFirstResponder()
        let address = tfCity.text!
        load(show: true)
        
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(address) { (placeMarks, error) in
            self.load(show: false)
            
            if error == nil {
                if !self.savePlace(with: placeMarks?.first) {
                    self.showMessage(type: .error("Não foi encontrado nenhum local!"))
                }
            } else {
                self.showMessage(type: .error("Erro desconhecido"))
            }
            
            
        }
    }
    
    func savePlace(with placemarker: CLPlacemark?) -> Bool {
        guard let placeMark = placemarker, let coordinate = placemarker?.location?.coordinate else{
            return false
        }
        
        let name = placemarker?.name ?? placemarker?.country ?? "Desconhecido"
        let address = Place.getFormatterAddress(with: placeMark)
        place = Place(name: name, latitude: coordinate.latitude, longitute: coordinate.longitude, address: address)
        
        let region = MKCoordinateRegion(center: coordinate, latitudinalMeters: 3500, longitudinalMeters: 3500)
        mapView.setRegion(region, animated: true)
        
        self.showMessage(type: .confirmation(place.name))
        
        return true
    }
    
    func showMessage(type: PlaceFinderMessageType){
        let title: String, message : String
        var hasConfirmation: Bool = false
        
        switch type {
            case .confirmation(let name):
                title = "Local encontrado"
                message = "Deseja adicionar o local \(name)"
                hasConfirmation = true
            case .error(let ErrorMessage):
                title = "Erro"
                message = ErrorMessage
                hasConfirmation = false
        }
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        if hasConfirmation{
            let confirmAction = UIAlertAction(title: "Ok", style: .default) { (action) in
                self.delegate?.addPlace(self.place)
                self.dismiss(animated: true, completion: nil)
            }
            alert.addAction(confirmAction)
        }
        
        present(alert, animated: true, completion: nil)
    }
    
    func load(show: Bool){
        viLoading.isHidden = !show
        
        if show{
            activeIndicatorLoading.startAnimating()
        } else {
            activeIndicatorLoading.stopAnimating()
        }
        
    }
    
    @IBAction func closeModal(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

}
