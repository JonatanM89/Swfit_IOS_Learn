//
//  WinnersTableViewController.swift
//  campeao_das_copas
//
//  Created by Convidado on 03/08/20.
//  Copyright © 2020 Convidado. All rights reserved.
//

import UIKit

class WinnersTableViewController: UITableViewController {

    var worldCup: [WorldCup] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadWordCups()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! WorldCupViewController
        vc.worldCup = worldCup[tableView.indexPathForSelectedRow!.row]
    }
    
    func loadWordCups() {
        let fileUrl = Bundle.main.url(forResource: "winners.json", withExtension: nil)!
        
        do {
            let jsonData = try! Data(contentsOf: fileUrl)
            worldCup = try JSONDecoder().decode([WorldCup].self, from: jsonData)
        }catch {
            print(error)
        }
        
    }
    
    // MARK: - Table view data source

    //Quando eu uso uma seção eu não preciso implementar esse método
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return worldCup.count
    }

    //Esse método é chamado sempre que a tabela for apresentar um celula
    //Sempre que a tableView for preparar uma cell esse método é disparado
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! WorldCupTableViewCell
        cell.prepare(with: worldCup[indexPath.row])
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
