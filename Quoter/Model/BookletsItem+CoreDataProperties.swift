//
//  BookletsItem+CoreDataProperties.swift
//  
//
//  Created by Brandon Low on 11/3/19.
//
//

import Foundation
import CoreData


extension BookletsItem {

    @nonobjc public class func createFetchRequest() -> NSFetchRequest<BookletsItem> {
        return NSFetchRequest<BookletsItem>(entityName: "BookletsItem")
    }

    @NSManaged public var pagesPerBook: Int32
    @NSManaged public var pricePerThousandCoverPaper: Int32
    @NSManaged public var pricePerThousandTextPaper: Int32

}
