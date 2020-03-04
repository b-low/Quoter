//
//  QuoteItem.swift
//  Quoter
//
//  Created by Brandon Low on 1/3/20.
//  Copyright © 2020 Brandon Low. All rights reserved.
//

import Foundation

class QuoteItem: NSObject, Codable {
    @objc var itemType: String
    @objc var name: String
    @objc var subtotal: Int
    @objc var quantity: Int
    
    private enum CodingKeys : String, CodingKey {
        case itemType = "item_type"
        case name
        case subtotal
        case quantity
    }
    
    init(itemType: String, name: String, subtotal: Int, quantity: Int) {
        self.itemType = itemType
        self.name = name
        self.subtotal = subtotal
        self.quantity = quantity
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.itemType = try container.decode(String.self, forKey: .itemType)
        self.name = try container.decode(String.self, forKey: .name)
        self.subtotal = try container.decode(Int.self, forKey: .subtotal)
        self.quantity = try container.decode(Int.self, forKey: .quantity)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(itemType, forKey: .itemType)
        try container.encode(name, forKey: .name)
        try container.encode(subtotal, forKey: .subtotal)
        try container.encode(quantity, forKey: .quantity)
    }
    
}



class PaperItem: QuoteItem {
    var paperItemType: String
    var bleed: Double
    var extra: Double
    var pieceHeight: Double
    var pieceWidth: Double
    
    private enum CodingKeys : String, CodingKey {
        case paperItemType = "paper_item_type"
        case bleed
        case extra
        case pieceHeight = "piece_height"
        case pieceWidth = "piece_width"
    }
    
    init(paperItemType: String, name: String, subtotal: Int, quantity: Int, bleed: Double, extra: Double, pieceHeight: Double, pieceWidth: Double) {
        self.paperItemType = paperItemType
        self.bleed = bleed
        self.extra = extra
        self.pieceHeight = pieceHeight
        self.pieceWidth = pieceWidth
        super.init(itemType: "paper", name: name, subtotal: subtotal, quantity: quantity)
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.paperItemType = try container.decode(String.self, forKey: .paperItemType)
        self.bleed = try container.decode(Double.self, forKey: .bleed)
        self.extra = try container.decode(Double.self, forKey: .extra)
        self.pieceHeight = try container.decode(Double.self, forKey: .pieceHeight)
        self.pieceWidth = try container.decode(Double.self, forKey: .pieceWidth)
        
        try super.init(from: decoder)
    }
    
    override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(paperItemType, forKey: .paperItemType)
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
        super.init(paperItemType: "basic", name: name, subtotal: subtotal, quantity: quantity, bleed: bleed, extra: extra, pieceHeight: pieceHeight, pieceWidth: pieceWidth)
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

class PadItem: PaperItem {
    var pricePerThousand: Int
    var sheetsPerPad: Int
    
    private enum CodingKeys : String, CodingKey {
        case pricePerThousand = "price_per_thousand"
        case sheetsPerPad = "sheets_per_pad"
    }
    
    init(name: String, subtotal: Int, quantity: Int, bleed: Double, extra: Double, pieceHeight: Double, pieceWidth: Double, pricePerThousand: Int, sheetsPerPad: Int) {
        self.pricePerThousand = pricePerThousand
        self.sheetsPerPad = sheetsPerPad
        super.init(paperItemType: "pad", name: name, subtotal: subtotal, quantity: quantity, bleed: bleed, extra: extra, pieceHeight: pieceHeight, pieceWidth: pieceWidth)
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

class BookletItem: PaperItem {
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
        super.init(paperItemType: "booklet", name: name, subtotal: subtotal, quantity: quantity, bleed: bleed, extra: extra, pieceHeight: pieceHeight, pieceWidth: pieceWidth)
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
        super.init(itemType: "wide_format", name: name, subtotal: subtotal, quantity: quantity)
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
    // TODO: type = custom
}




// Inspired by https://github.com/nsscreencast/305-codable-and-polymorphism/blob/master/Codable%20and%20Polymorphism.playground/Contents.swift
enum QuoteItemWrapper: Decodable {
    case paper(PaperItem)
    case wideFormat(WideFormatItem)
    case custom(CustomItem)
    
    var unwrapped: QuoteItem {
        switch self {
        case .paper(let item): return item
        case .wideFormat(let item): return item
        case .custom(let item): return item
        }
    }
    
    private enum CodingKeys : String, CodingKey {
        case itemType = "item_type"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let itemType = try container.decode(String.self, forKey: .itemType)
        switch itemType {
        case "paper":
            self = .paper(try PaperItem(from: decoder))
            break
        case "wide_format":
            self = .wideFormat(try WideFormatItem(from: decoder))
            break
        case "custom":
            self = .custom(try CustomItem(from: decoder))
            break
        default:
            throw DecodingError.dataCorruptedError(forKey: .itemType, in: container, debugDescription: "Unhandled quote item type: \(itemType)")
        }
    }
}
