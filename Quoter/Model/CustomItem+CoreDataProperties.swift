//
//  CustomItem+CoreDataProperties.swift
//  
//
//  Created by Brandon Low on 11/3/19.
//
//

import Foundation
import CoreData


extension CustomItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CustomItem> {
        return NSFetchRequest<CustomItem>(entityName: "CustomItem")
    }


}
