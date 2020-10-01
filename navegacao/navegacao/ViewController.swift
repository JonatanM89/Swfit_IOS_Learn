//
//  ViewController.swift
//  navegacao
//
//  Created by Convidado on 28/07/20.
//  Copyright © 2020 Convidado. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func showSecondScreen(_ sender: Any) {
        performSegue(withIdentifier: "segue1", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func voltarTela1(segue: UIStoryboardSegue){
        
    }
}

