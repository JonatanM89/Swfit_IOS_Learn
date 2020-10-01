//
//  ResultViewController.swift
//  Mensagens
//
//  Copyright © 2017 Eric Brito. All rights reserved.
//

import UIKit

class ResultViewController: BaseViewController {

    @IBOutlet weak var viBorder: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lbMessage.text = message.text
        
        lbMessage.textColor = message.textColor
        //Esconde navigations bar
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    //No toque na tela volta para pagina anterior
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //Voltando para a tela anterior
        navigationController?.popViewController(animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc  = segue.destination as! ScreenColorViewController
        vc.message = message
    }
}
