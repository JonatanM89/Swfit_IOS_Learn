//
//  QuotesManeger.swift
//  Pensamentos
//
//  Created by Convidado on 23/08/20.
//  Copyright © 2020 Convidado. All rights reserved.
//

import Foundation

struct QuotesManeger{
    
    let quotes: [Quote]
    
    init(){
        let fileUrl = Bundle.main.url(forResource: "quotes", withExtension: "json")!
        let jsonData = try! Data(contentsOf: fileUrl)
        let jsonDecoder = JSONDecoder()
        
        quotes = try! jsonDecoder.decode([Quote].self, from: jsonData)
        
    }
    
    func getRandomQuote() ->  Quote {
        let index = arc4random_uniform(UInt32(quotes.count))
        
        return quotes[Int(index)]
        
        
    }
    
}
