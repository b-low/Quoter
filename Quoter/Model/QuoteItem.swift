//
//  QuoteItem.swift
//  Quoter
//
//  Created by Brandon Low on 1/3/20.
//  Copyright © 2020 Brandon Low. All rights reserved.
//

import Foundation

class QuoteItem: NSObject, Codable {
    @objc var name: String
    @objc var subtotal: Int
    @objc var quantity: Int
    
    private enum CodingKeys : String, CodingKey {
        case name
        case subtotal
        case quantity
    }
    
    init(name: String, subtotal: Int, quantity: Int) {
        self.name = name
        self.subtotal = subtotal
        self.quantity = quantity
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.name = try container.decode(String.self, forKey: .name)
        self.subtotal = try container.decode(Int.self, forKey: .subtotal)
        self.quantity = try container.decode(Int.self, forKey: .quantity)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(name, forKey: .name)
        try container.encode(subtotal, forKey: .subtotal)
        try container.encode(quantity, forKey: .quantity)
    }
    
}



class PaperItem: QuoteItem {
    var bleed: Double
    var extra: Double
    var pieceHeight: Double
    var pieceWidth: Double
    
    private enum CodingKeys : String, CodingKey {
        case bleed
        case extra
        case pieceHeight = "piece_height"
        case pieceWidth = "piece_width"
    }
    
    init(name: String, subtotal: Int, quantity: Int, bleed: Double, extra: Double, pieceHeight: Double, pieceWidth: Double) {
        self.bleed = bleed
        self.extra = extra
        self.pieceHeight = pieceHeight
        self.pieceWidth = pieceWidth
        super.init(name: name, subtotal: subtotal, quantity: quantity)
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.bleed = try container.decode(Double.self, forKey: .bleed)
        self.extra = try container.decode(Double.self, forKey: .extra)
        self.pieceHeight = try container.decode(Double.self, forKey: .pieceHeight)
        self.pieceWidth = try container.decode(Double.self, forKey: .pieceWidth)
        
        try super.init(from: decoder)
    }
    
    override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(bleed, forKey: .bleed)
        try container.encode(extra, forKey: .extra)
        try container.encode(pieceHeight, forKey: .pieceHeight)
        try container.encode(pieceWidth, forKey: .pieceWidth)
    }
}

class BasicItem: PaperItem {
    var pricePerThousand: Int
    
    private enum CodingKeys : String, CodingKey {
        case pricePerThousand = "price_per_thousand"
    }
    
    init(name: String, subtotal: Int, quantity: Int, bleed: Double, extra: Double, pieceHeight: Double, pieceWidth: Double, pricePerThousand: Int) {
        self.pricePerThousand = pricePerThousand
        super.init(name: name, subtotal: subtotal, quantity: quantity, bleed: bleed, extra: extra, pieceHeight: pieceHeight, pieceWidth: pieceWidth)
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.pricePerThousand = try container.decode(Int.self, forKey: .pricePerThousand)
        
        try super.init(from: decoder)
    }
    
    override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(pricePerThousand, forKey: .pricePerThousand)
    }
}

class PadsItem: PaperItem {
    var pricePerThousand: Int
    var sheetsPerPad: Int
    
    private enum CodingKeys : String, CodingKey {
        case pricePerThousand = "price_per_thousand"
        case sheetsPerPad = "sheets_per_pad"
    }
    
    init(name: String, subtotal: Int, quantity: Int, bleed: Double, extra: Double, pieceHeight: Double, pieceWidth: Double, pricePerThousand: Int, sheetsPerPad: Int) {
        self.pricePerThousand = pricePerThousand
        self.sheetsPerPad = sheetsPerPad
        super.init(name: name, subtotal: subtotal, quantity: quantity, bleed: bleed, extra: extra, pieceHeight: pieceHeight, pieceWidth: pieceWidth)
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.pricePerThousand = try container.decode(Int.self, forKey: .pricePerThousand)
        self.sheetsPerPad = try container.decode(Int.self, forKey: .sheetsPerPad)
        
        try super.init(from: decoder)
    }
    
    override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(pricePerThousand, forKey: .pricePerThousand)
        try container.encode(sheetsPerPad, forKey: .sheetsPerPad)
    }
}

class BookletsItem: PaperItem {
    var pagesPerBook: Int
    var pricePerThousandCoverPaper: Int
    var pricePerThousandTextPaper: Int
    
    private enum CodingKeys : String, CodingKey {
        case pagesPerBook = "pages_per_book"
        case pricePerThousandCoverPaper = "price_per_thousand_cover_paper"
        case pricePerThousandTextPaper = "price_per_thousand_text_paper"
    }
    
    init(name: String, subtotal: Int, quantity: Int, bleed: Double, extra: Double, pieceHeight: Double, pieceWidth: Double, pagesPerBook: Int, pricePerThousandCoverPaper: Int, pricePerThousandTextPaper: Int) {
        self.pagesPerBook = pagesPerBook
        self.pricePerThousandCoverPaper = pricePerThousandCoverPaper
        self.pricePerThousandTextPaper = pricePerThousandTextPaper
        super.init(name: name, subtotal: subtotal, quantity: quantity, bleed: bleed, extra: extra, pieceHeight: pieceHeight, pieceWidth: pieceWidth)
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.pagesPerBook = try container.decode(Int.self, forKey: .pagesPerBook)
        self.pricePerThousandCoverPaper = try container.decode(Int.self, forKey: .pricePerThousandCoverPaper)
        self.pricePerThousandTextPaper = try container.decode(Int.self, forKey: .pricePerThousandTextPaper)
        
        try super.init(from: decoder)
    }
    
    override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(pagesPerBook, forKey: .pagesPerBook)
        try container.encode(pricePerThousandCoverPaper, forKey: .pricePerThousandCoverPaper)
        try container.encode(pricePerThousandTextPaper, forKey: .pricePerThousandTextPaper)
    }
}



class WideFormatItem: QuoteItem {
    var pieceHeight: Double
    var pieceWidth: Double
    var pricePerSquareFoot: Int
    
    private enum CodingKeys : String, CodingKey {
        case pieceHeight = "piece_height"
        case pieceWidth = "piece_width"
        case pricePerSquareFoot = "price_per_square_foot"
    }
    
    init(name: String, subtotal: Int, quantity: Int, pieceHeight: Double, pieceWidth: Double, pricePerSquareFoot: Int) {
        self.pieceHeight = pieceHeight
        self.pieceWidth = pieceWidth
        self.pricePerSquareFoot = pricePerSquareFoot
        super.init(name: name, subtotal: subtotal, quantity: quantity)
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.pieceWidth = try container.decode(Double.self, forKey: .pieceWidth)
        self.pieceHeight = try container.decode(Double.self, forKey: .pieceHeight)
        self.pricePerSquareFoot = try container.decode(Int.self, forKey: .pricePerSquareFoot)
        
        try super.init(from: decoder)
    }
    
    override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(pieceWidth, forKey: .pieceWidth)
        try container.encode(pieceHeight, forKey: .pieceHeight)
        try container.encode(pricePerSquareFoot, forKey: .pricePerSquareFoot)
    }
}



class CustomItem: QuoteItem {
    
}
