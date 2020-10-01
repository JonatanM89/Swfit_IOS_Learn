//
//  ViewController.swift
//  components
//
//  Created by Convidado on 29/07/20.
//  Copyright © 2020 Convidado. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var tfsenha: UITextField!
    @IBOutlet weak var tfemail: UITextField!
    @IBOutlet weak var tfnome: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        tfsenha.delegate = self
        tfemail.delegate = self
        tfnome.delegate  = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //Pega as ações de quando se aperta no botão return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == tfnome {
            tfemail.becomeFirstResponder()
        }

        if textField == tfemail {
            //tfsenha.becomeFirstResponder()
            textField.resignFirstResponder()
        }
        
        return true
    }
    
    //Pega as ações de quando se termina e edição em campos textField
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField == tfnome {
            return !textField.text!.isEmpty
        }
        
        return true
    }    
    
    //Aqui pega as ações de quando se toca na tela
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

}

