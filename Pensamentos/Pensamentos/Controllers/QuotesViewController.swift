//
//  QuotesViewController.swift
//  Pensamentos
//
//  Created by Convidado on 23/08/20.
//  Copyright © 2020 Convidado. All rights reserved.
//

import UIKit

class QuotesViewController: UIViewController {

    @IBOutlet weak var ivPhotoBg: UIImageView!
    @IBOutlet weak var ivPhoto: UIImageView!
    @IBOutlet weak var lbQuote: UILabel!
    @IBOutlet weak var lbAuthor: UILabel!    
    @IBOutlet weak var ctTop: NSLayoutConstraint!
    
    let quotesManager = QuotesManeger()
    var timer: Timer?
    
    let config = Configuration.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "Refresh"), object: nil, queue: nil){
            (notification) in
            self.formatView()
        }
        // Do any additional setup after loading the view.
    }
    

    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        formatView()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        prepareQuote()
    }
    
    func prepareQuote(){
        timer?.invalidate()
        if config.autoRefresh {
            Timer.scheduledTimer(withTimeInterval: config.timeInterval, repeats: true, block: {(timer) in self.showRandomQuote() })
        }
        
        showRandomQuote()
    }
    
    func formatView(){
        view.backgroundColor = config.colorSchema == 0 ? .white : UIColor(displayP3Red: 156.0/255.0, green: 68/255, blue: 15/255, alpha: 1.0)
        lbQuote.textColor = config.colorSchema == 0 ? .black : .white
        lbAuthor.textColor = config.colorSchema == 0 ? UIColor(displayP3Red: 192/255.0, green: 96/255, blue: 49/255, alpha: 1.0) : .yellow
        prepareQuote()
    }

    func showRandomQuote(){
        let quote = quotesManager.getRandomQuote()
        
        lbQuote.text = quote.quote
        lbAuthor.text = quote.author
        ivPhoto.image = UIImage(named: quote.image)
        ivPhotoBg.image = UIImage(named: quote.image)
        
        lbQuote.alpha =  0
        lbAuthor.alpha = 0
        ivPhotoBg.alpha = 0
        ivPhoto.alpha = 0
        
        ctTop.constant = 50
        
        view.layoutIfNeeded()
        
        UIView.animate(withDuration: 2.5, animations: {
            self.lbQuote.alpha =  1
            self.lbAuthor.alpha = 1
            self.ivPhotoBg.alpha = 0.25
            self.ivPhoto.alpha = 1
            
            self.ctTop.constant = 10
            self.view.layoutIfNeeded()
            
        })
    }
}
