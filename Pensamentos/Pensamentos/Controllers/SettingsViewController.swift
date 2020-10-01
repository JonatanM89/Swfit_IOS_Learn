//
//  SettingsViewController.swift
//  Pensamentos
//
//  Created by Convidado on 23/08/20.
//  Copyright © 2020 Convidado. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var swAutoRefresh: UISwitch!
    @IBOutlet weak var slTimerInterval: UISlider!
    @IBOutlet weak var scColorSchema: UISegmentedControl!
    @IBOutlet weak var lbTimeInterval: UILabel!
    
    var config = Configuration.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "Refresh"), object: nil, queue: nil){
            (notification) in
            self.formatView()
        }

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        formatView()
    }
    
    func formatView(){
        swAutoRefresh.setOn(config.autoRefresh, animated: false)
        slTimerInterval.setValue(Float(config.timeInterval), animated: false)
        scColorSchema.selectedSegmentIndex = config.colorSchema
        
        changeTimeIntervalLabel(with: config.timeInterval)
    }
    
    func changeTimeIntervalLabel(with value: Double) {
        lbTimeInterval.text = "Mudar após \(Int(value)) segundos"
    }
    
    @IBAction func changeAutoRefresh(_ sender: UISwitch) {
        config.autoRefresh = sender.isOn
    }
    

    @IBAction func changeTimeInterval(_ sender: UISlider) {
        let value = Double(round(sender.value))
        changeTimeIntervalLabel(with: value)
        config.timeInterval = value
    }
    
    @IBAction func changeColorSchema(_ sender: UISegmentedControl) {
        config.colorSchema = sender.selectedSegmentIndex
    }
}
