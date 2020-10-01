//
//  ViewController.swift
//  appConversao
//
//  Created by Convidado on 25/07/20.
//  Copyright © 2020 Convidado. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var lbUnity: UILabel!
    @IBOutlet weak var textFielValue: UITextField!
    @IBOutlet weak var btCelsius: UIButton!
    @IBOutlet weak var btFaranheint: UIButton!
    @IBOutlet weak var labelResult: UILabel!
    @IBOutlet weak var labelResultunity: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func onClickNext(_ sender: UIButton) {
        switch lbUnity.text! {
            case "Temperatura" :
                lbUnity.text = "Peso"
                btCelsius.setTitle("Kilo", for: .normal)
                btFaranheint.setTitle("Libra", for: .normal)
            case "Pesp" :
                lbUnity.text = "Moeda"
                btCelsius.setTitle("Real", for: .normal)
                btFaranheint.setTitle("Dolar", for: .normal)
            case "Moeda" :
                lbUnity.text = "Distâcia"
                btCelsius.setTitle("Metro", for: .normal)
                btFaranheint.setTitle("Kilometro", for: .normal)
            default :
                lbUnity.text = "Peso"
                btCelsius.setTitle("Celsius", for: .normal)
                btFaranheint.setTitle("Faranheint", for: .normal)

        }
        
        onClickConvert(nil)
        
    }
    
    @IBAction func onClickConvert(_ sender: UIButton?) {
        if let sender = sender{
            if sender == btCelsius{
                btFaranheint.alpha = 0.5
            } else{
                btCelsius.alpha = 0.5
            }
            
            sender.alpha = 1.0
        
            switch lbUnity.text! {
                case "Temperatura" :
                    calcTemp()
                case "Peso" :
                    calcPeso()
                case "Moeda" :
                    calcMoeda()
                default :
                    calcDistance()
            
            }
            
        }
    }
    
    func calcTemp(){
        guard let temperatura = Double(textFielValue.text!) else {return}
    
        if btCelsius.alpha == 1.0{
            labelResultunity.text = "Farenheint"
            labelResult.text = String(temperatura * 1.8 + 32)
            
        } else {
            labelResultunity.text = "Celsius"
            labelResult.text = String((temperatura - 32) / 1.8 )
            
        }
    }
    
    func calcPeso(){
        
    }
    
    func calcMoeda(){
        guard let currency = Double(textFielValue.text!) else {return}
        
        if btCelsius.alpha == 1.0{
            labelResultunity.text = "Dólar"
            labelResult.text = String(currency / 3.5)
            
        } else {
            labelResultunity.text = "Real"
            labelResult.text = String(currency * 3.5  )
            
        }
    }
    
    func calcDistance(){
        guard let distance = Double(textFielValue.text!) else {return}
        
        if btCelsius.alpha == 1.0{
            labelResultunity.text = "Kilometro"
            labelResult.text = String(distance / 1000)
            
        } else {
            labelResultunity.text = "Metros"
            labelResult.text = String(distance * 1000  )
            
        }
    }
    
    
}

