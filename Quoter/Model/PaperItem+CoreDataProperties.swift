//
//  PaperItem+CoreDataProperties.swift
//  
//
//  Created by Brandon Low on 11/3/19.
//
//

import Foundation
import CoreData


extension PaperItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PaperItem> {
        return NSFetchRequest<PaperItem>(entityName: "PaperItem")
    }

    @NSManaged public var bleed: Double
    @NSManaged public var extra: Double
    @NSManaged public var pieceHeight: Double
    @NSManaged public var pieceWidth: Double
    @NSManaged public var quantity: Int32

}
