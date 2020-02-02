//
//  Quote.swift
//  MrQuotes
//
//  Created by Mac on 1/29/20.
//  Copyright © 2020 Yasin Shamrat. All rights reserved.
//

import Foundation

class QuoteModel {
    var quote = ""
    var author = ""
    var isFavorite = false
    
    init(quote: String, author: String) {
        self.quote = quote
        self.author = author
    }
}
