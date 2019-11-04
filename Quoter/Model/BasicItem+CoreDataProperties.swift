//
//  BasicItem+CoreDataProperties.swift
//  
//
//  Created by Brandon Low on 11/3/19.
//
//

import Foundation
import CoreData


extension BasicItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<BasicItem> {
        return NSFetchRequest<BasicItem>(entityName: "BasicItem")
    }

    @NSManaged public var pricePerThousand: Int32

}
