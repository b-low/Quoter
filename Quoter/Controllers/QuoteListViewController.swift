//
//  QuoteListViewController.swift
//  Quoter
//
//  Created by Brandon Low on 8/18/19.
//  Copyright © 2019 Brandon Low. All rights reserved.
//

import Cocoa
import CoreData

class QuoteListViewController: NSViewController {
    
    @IBOutlet var quoteItems: NSArrayController!
    @objc dynamic var context: NSManagedObjectContext {
        return DB.default.persistentContainer.viewContext
    }
    
    @IBOutlet weak var tableView: NSTableView!
//    var items: [QuoteItem] = [
//        CustomItem(name: "Bindery", subtotal: 10000),
//        CustomItem(name: "Orange", subtotal: 120547),
//        CustomItem(name: "Banana", subtotal: 5817),
//        CustomItem(name: "Test", subtotal: 96854),
//        CustomItem(name: "asdf", subtotal: 068172),
//        CustomItem(name: "Bindery", subtotal: 10000),
//        CustomItem(name: "Orange", subtotal: 120547),
//        CustomItem(name: "Banana", subtotal: 5817),
//        CustomItem(name: "Test", subtotal: 96854),
//        CustomItem(name: "asdf", subtotal: 068172),
//        CustomItem(name: "Bindery", subtotal: 10000),
//        CustomItem(name: "Orange", subtotal: 120547),
//        CustomItem(name: "Banana", subtotal: 5817),
//        CustomItem(name: "Test", subtotal: 96854),
//        CustomItem(name: "asdf", subtotal: 068172)
//    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createDummyData();
        
//        tableView.delegate = self
//        tableView.dataSource = self
//        tableView.target = self
    }
    
    func createDummyData() {
        print("BP -1")
        //let og = NSEntityDescription.insertNewObject(forEntityName: "QuoteItem", into: context) as! QuoteItem
        let og = quoteItems.newObject() as AnyObject
        og.setValue("the og", forKey: "name")
        og.setValue(100000, forKey: "subtotal")
        print("BP 0.0")
        
        
        quoteItems.addObject(og as Any)
        
        let test = NSEntityDescription.insertNewObject(forEntityName: "CustomItem", into: context) as! CustomItem
        test.name = "Bindery"
        test.subtotal = 100000;

        let test2 = NSEntityDescription.insertNewObject(forEntityName: "CustomItem", into: context) as! CustomItem
        test2.name = "Orange"
        test2.subtotal = 120547;

        let test3 = NSEntityDescription.insertNewObject(forEntityName: "CustomItem", into: context) as! CustomItem
        test3.name = "Banana"
        test3.subtotal = 5817;

        let test4 = NSEntityDescription.insertNewObject(forEntityName: "CustomItem", into: context) as! CustomItem
        test4.name = "Test"
        test4.subtotal = 96854;

        let test5 = NSEntityDescription.insertNewObject(forEntityName: "CustomItem", into: context) as! CustomItem
        test5.name = "asdf"
        test5.subtotal = 068172;


        quoteItems.addObject(test);
        quoteItems.addObject(test2);
        quoteItems.addObject(test3);
        quoteItems.addObject(test4);
        quoteItems.addObject(test5);
        
        
        print("BP 1")
        do {
            try context.save()
        } catch let error as NSError {
            print("Error saving: \(error), \(error.userInfo)")
        }
        
        print("BP 2")
        
        let fetchRequest: NSFetchRequest<CustomItem> = CustomItem.fetchRequest();
        let items = try! DB.default.persistentContainer.viewContext.fetch(fetchRequest)
        items.forEach {
            print("\($0.name): \($0.subtotal)")
        }
        
        print("BP 3")
    }
    
}

//extension QuoteListViewController: NSTableViewDataSource {
//
//    func numberOfRows(in tableView: NSTableView) -> Int {
//        return items.count
//    }
//
//    func tableView(_ tableView: NSTableView, objectValueFor tableColumn: NSTableColumn?, row: Int) -> Any? {
//        return nil
//        return items[row]
//    }
//
//}
//
//extension QuoteListViewController: NSTableViewDelegate {
//
//    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
//
//        if row >= items.count {
//            return nil
//        }
//
//        let item = items[row]
//
//        if let cell = tableView.makeView(withIdentifier: QuoteItemCellView.identifier, owner: nil) as? QuoteItemCellView {
//            cell.textField?.stringValue = item.name
//            cell.subtotalField.stringValue = item.subtotalDisplay
//            return cell
//        }
//        print("Requested item2 \(item.name)")
//
//        return nil
//    }
//
//}
