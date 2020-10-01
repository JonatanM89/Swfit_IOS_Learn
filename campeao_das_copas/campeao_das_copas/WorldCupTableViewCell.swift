//
//  WorldCupTableViewCell.swift
//  campeao_das_copas
//
//  Created by Convidado on 04/08/20.
//  Copyright © 2020 Convidado. All rights reserved.
//

import UIKit

class WorldCupTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var labelYear: UILabel!
    
    @IBOutlet weak var lbPais: UILabel!
    @IBOutlet weak var lbScoreVice: UILabel!
    @IBOutlet weak var lbEscoreWinner: UILabel!
    @IBOutlet weak var lbVice: UILabel!
    @IBOutlet weak var lbWinner: UILabel!
    @IBOutlet weak var imgViewVicce: UIImageView!
    @IBOutlet weak var imgViewWinner: UIImageView!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func prepare(with cup: WorldCup){
        labelYear.text = "\(cup.year)"
        imgViewWinner.image = UIImage(named: cup.winner)
        imgViewVicce.image = UIImage(named: cup.vice)
        lbWinner.text = cup.winner
        lbVice.text = cup.vice
        lbPais.text = cup.country
        lbEscoreWinner.text = cup.winnerScore
        lbScoreVice.text = cup.viceScore        
    }

}
