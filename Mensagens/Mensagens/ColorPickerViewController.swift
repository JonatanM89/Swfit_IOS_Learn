//
//  ColorPickerViewController.swift
//  Mensagens
//
//  Created by Convidado on 29/07/20.
//  Copyright © 2020 Eric Brito. All rights reserved.
//

import UIKit

protocol ColorPickerDelegate : class {
    func applyColor(color:UIColor)
}

class ColorPickerViewController: UIViewController {
    @IBOutlet weak var viColor: UIView!
    @IBOutlet weak var sliderBlue: UISlider!
    @IBOutlet weak var sliderRed: UISlider!
    @IBOutlet weak var sliderGreen: UISlider!
    
     var delegate : ColorPickerDelegate?
    
    override func viewDidLoad() {
    
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
 
    @IBAction func changeColor(_ sender: UIButton) {
        //Sair da tela
        dismiss(animated: true, completion: nil)
        delegate?.applyColor(color: viColor.backgroundColor!)
    }
    
    
    @IBAction func chooseColor(_ sender: UISlider) {
        viColor.backgroundColor = UIColor(red: CGFloat(sliderRed.value),                                          green: CGFloat(sliderGreen.value), blue: CGFloat(sliderBlue.value), alpha: 1.0)
    }
    
}


