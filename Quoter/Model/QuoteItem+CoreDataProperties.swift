//
//  QuoteItem+CoreDataProperties.swift
//  
//
//  Created by Brandon Low on 11/3/19.
//
//

import Foundation
import CoreData


extension QuoteItem {

    @nonobjc public class func createFetchRequest() -> NSFetchRequest<QuoteItem> {
        return NSFetchRequest<QuoteItem>(entityName: "QuoteItem")
    }

    @NSManaged public var name: String?
    @NSManaged public var subtotal: Int32

}
