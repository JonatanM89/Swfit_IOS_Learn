//
//  WorldCupViewController.swift
//  campeao_das_copas
//
//  Created by Convidado on 03/08/20.
//  Copyright © 2020 Convidado. All rights reserved.
//

import UIKit

class WorldCupViewController: UIViewController {

    var worldCup : WorldCup!
    
    @IBOutlet weak var lbCountry: UILabel!
    @IBOutlet weak var lbCountry2: UILabel!
    @IBOutlet weak var lbScore: UILabel!
    @IBOutlet weak var imgView2: UIImageView!
    @IBOutlet weak var imgView1: UIImageView!
    @IBOutlet weak var tbViewTrajetoria: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "World Cup \(worldCup.year!)"
        imgView1.image = UIImage(named: "\(worldCup.winner).png")
        imgView2.image = UIImage(named: "\(worldCup.vice).png")
        lbCountry.text = worldCup.winner
        lbCountry2.text = worldCup.vice
        lbScore.text = "\(worldCup.winnerScore) x \(worldCup.viceScore)"
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension WorldCupViewController: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return worldCup.matches.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let games = worldCup.matches[section].games
        return games.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! GamesTableViewCell
        
        let match = worldCup.matches[indexPath.section]
        let game  = match.games[indexPath.row]
        
        cell.prepare(with: game)
      return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let match = worldCup.matches[section]
        return match.stage
    }
    
}

extension WorldCupViewController: UITableViewDelegate{
    
}

