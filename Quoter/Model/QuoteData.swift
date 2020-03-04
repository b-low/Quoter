//
//  QuoteData.swift
//  Quoter
//
//  Created by Brandon Low on 3/3/20.
//  Copyright © 2020 Brandon Low. All rights reserved.
//

import Foundation

class QuoteData: NSObject, Codable {
    
    @objc dynamic let quoteItems: [QuoteItem]
    // TODO: Add customer name, date, etc.
    
    private enum CodingKeys : String, CodingKey {
        case quoteItems = "quote_items"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        var quoteItems: [QuoteItem] = []
        var resultsContainer = try container.nestedUnkeyedContainer(forKey: .quoteItems)
        while (!resultsContainer.isAtEnd) {
            let wrapper = try resultsContainer.decode(QuoteItemWrapper.self)
            quoteItems.append(wrapper.unwrapped)
        }
        self.quoteItems = quoteItems
    }
    
}
