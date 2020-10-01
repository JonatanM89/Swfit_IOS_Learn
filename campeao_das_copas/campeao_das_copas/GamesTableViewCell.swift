//
//  GamesTableViewCell.swift
//  campeao_das_copas
//
//  Created by Convidado on 09/08/20.
//  Copyright © 2020 Convidado. All rights reserved.
//

import UIKit

class GamesTableViewCell: UITableViewCell {

    @IBOutlet weak var lbAway: UILabel!
    @IBOutlet weak var imgAway: UIImageView!
    @IBOutlet weak var imgHome: UIImageView!
    @IBOutlet weak var lbPlacar: UILabel!
    @IBOutlet weak var lbHome: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
        
    func prepare(with game:Games){
        imgHome.image = UIImage(named: "\(game.home).png")
        imgAway.image = UIImage(named: "\(game.away).png")
        lbHome.text   = game.home
        lbAway.text   = game.away
        lbPlacar.text = game.score
    }
    
}
