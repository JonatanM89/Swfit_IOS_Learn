//
//  PlacesTableViewController.swift
//  quero_conhecer
//
//  Created by Convidado on 30/08/20.
//  Copyright © 2020 Convidado. All rights reserved.
//

import UIKit

class PlacesTableViewController: UITableViewController {
    
    var places: [Place] = []
    let ud = UserDefaults.standard
    var lbNoPlaces: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        createLbBackground()
        loadPlaces()
    }
    
    private func createLbBackground(){
        lbNoPlaces = UILabel()
        lbNoPlaces.text = "Cadastre os locais que deseja conhecer \n clicando no botão + acima"
        lbNoPlaces.textAlignment = .center
        lbNoPlaces.numberOfLines = 0
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier != "mapSegue"{
            let vc = segue.destination as! PlacesFinderViewController
            vc.delegate = self
        } else {
            let vc = segue.destination as! MapViewController
            switch sender {
                case let place as Place:
                    vc.places = [place]
                default:
                    vc.places = places
            }
            
        }
    }
    
    
    func loadPlaces(){
        if let placesData = ud.data(forKey: "Places"){
            do{
                places = try JSONDecoder().decode([Place].self, from: placesData)
                tableView.reloadData()
            } catch {
                print(error.localizedDescription)
            }
            
        }
    }
    
    func savePlaces(){
        do {
            let json = try JSONEncoder().encode(places)
            ud.set(json, forKey: "Places")
        } catch {
            print(error.localizedDescription)
            
        }
    }
    
    @objc func showAll(){
        performSegue(withIdentifier: "mapSegue", sender: nil)
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if places.count > 0 {
            let btShowAll = UIBarButtonItem(title: "Mostrar todos no mapa", style: .plain, target: self, action: #selector(showAll))
            navigationItem.leftBarButtonItem = btShowAll
            tableView.backgroundView = nil
        } else {
            navigationItem.leftBarButtonItem = nil
            tableView.backgroundView = lbNoPlaces
            
        }
        
        return places.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let place =  places[indexPath.row]
        cell.textLabel?.text = place.name
        return cell
    }
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let place = places[indexPath.row]
        performSegue(withIdentifier: "mapSegue", sender: place)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            places.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            savePlaces()
        }
    }

}

extension PlacesTableViewController: PlaceFinderDelegate {
    func addPlace(_ place: Place) {
        if !places.contains(place){
            self.places.append(place)
            self.savePlaces()
            tableView.reloadData()
            
            
        }
    }
}
