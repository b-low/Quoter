//
//  QuoteData.swift
//  Quoter
//
//  Created by Brandon Low on 3/3/20.
//  Copyright © 2020 Brandon Low. All rights reserved.
//

import Foundation

class QuoteData: NSObject, Codable {
    
    @objc dynamic var quoteItems: [QuoteItem]
    // TODO: Add customer name, date, etc.
    
    private enum CodingKeys : String, CodingKey {
        case quoteItems = "quote_items"
    }
    
    override init() {
        quoteItems = []
        
        // DEBUG
        quoteItems.append(CustomItem(itemType: "custom", name: "Bindery", subtotal: 100000, quantity: 1))
        quoteItems.append(CustomItem(itemType: "custom", name: "Orange", subtotal: 120547, quantity: 4))
        quoteItems.append(CustomItem(itemType: "custom", name: "Banana", subtotal: 5817, quantity: 1))
        quoteItems.append(CustomItem(itemType: "custom", name: "Test", subtotal: 96854, quantity: 2))
        quoteItems.append(CustomItem(itemType: "custom", name: "asdf", subtotal: 068172, quantity: 5))
        
        print("Reached quote init")
        
        super.init()
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
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(quoteItems, forKey: .quoteItems)
    }
    
}
