//
//  Quote.swift
//  PensamentosUITests
//
//  Created by Convidado on 23/08/20.
//  Copyright © 2020 Convidado. All rights reserved.
//

import Foundation

struct Quote: Codable {
    let quote: String
    let author: String
    let image: String
    
    var quotesFormatted: String {
        return "⌘" + quote + "⌘"
    }
    
    var authorFormatted: String {
        return "- \(author) -"
    }
    
    
    
    
}
