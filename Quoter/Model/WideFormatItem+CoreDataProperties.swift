//
//  WideFormatItem+CoreDataProperties.swift
//  
//
//  Created by Brandon Low on 11/3/19.
//
//

import Foundation
import CoreData


extension WideFormatItem {

    @nonobjc public class func createFetchRequest() -> NSFetchRequest<WideFormatItem> {
        return NSFetchRequest<WideFormatItem>(entityName: "WideFormatItem")
    }

    @NSManaged public var pieceHeight: Double
    @NSManaged public var pieceWidth: Double
    @NSManaged public var pricePerSquareFoot: Int32
    @NSManaged public var quantity: Int32

}
