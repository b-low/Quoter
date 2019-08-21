//
//  QuoteItem.swift
//  Quoter
//
//  Created by Brandon Low on 8/19/19.
//  Copyright © 2019 Brandon Low. All rights reserved.
//

import Foundation

protocol QuoteItem {
    // The name of the quote item, which appears in the quote item list
    var name: String { get }
    
    // The subtotal of the item, in hundredths of cents
    var subtotal: Int { get }
}

extension QuoteItem {
    var subtotalDisplay: String {
        get {
            return String(format: "$%.2f", Double(subtotal)/10000.0)
        }
    }
}

struct CustomItem: QuoteItem {
    var name: String
    var subtotal: Int
}

struct BasicItem {
    var name: String
    var subtotal: Int {
        get {
            return 0
        }
    }
    
    var pieceWidth: Double
    var pieceHeight: Double
    var bleed: Double
    var extra: Double
    var quantity: Int
    
    var pricePerThousandPaper: Int // In hundredths of cents
}

struct PadsItem {
    var name: String
    var subtotal: Int {
        get {
            return 0
        }
    }
    
    var pieceWidth: Double
    var pieceHeight: Double
    var bleed: Double
    var extra: Double
    var pads: Int
    var sheetsPerPad: Int
    
    var pricePerThousandPaper: Int // In hundredths of cents
}

struct BookletsItem {
    var name: String
    var subtotal: Int {
        get {
            return 0
        }
    }
    
    var pieceWidth: Double
    var pieceHeight: Double
    var bleed: Double
    var extra: Double
    var books: Int
    var pagesPerBook: Int
    
    var pricePerThousandTextPaper: Int // In hundredths of cents
    var pricePerThousandCoverPaper: Int? // In hundredths of cents
}

struct WideFormatItem {
    var name: String
    var subtotal: Int {
        get {
            return 0
        }
    }
    
    var pieceWidth: Double
    var pieceHeight: Double
    var quantity: Int
    
    var pricePerSquareFoot: Int // In hundredths of cents
}


