//
//  SecondViewController.swift
//  navegacao
//
//  Created by Convidado on 28/07/20.
//  Copyright © 2020 Convidado. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func showScreen3(_ sender: Any) {
        performSegue(withIdentifier: "segue2", sender: nil)
    }
    
    @IBAction func onClickVoltar(_ sender: Any) {
        dismiss(animated: true, completion: nil)
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
