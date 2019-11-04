//
//  PadsItem+CoreDataProperties.swift
//  
//
//  Created by Brandon Low on 11/3/19.
//
//

import Foundation
import CoreData


extension PadsItem {

    @nonobjc public class func createFetchRequest() -> NSFetchRequest<PadsItem> {
        return NSFetchRequest<PadsItem>(entityName: "PadsItem")
    }

    @NSManaged public var pricePerThousand: Int32
    @NSManaged public var sheetsPerPad: Int32

}
