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
    
    lazy var fetchedResultsController: NSFetchedResultsController<QuoteItem> = {
        let fetchRequest = QuoteItem.createFetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        
        // Create Fetched Results Controller
        let fetchedResultsController = NSFetchedResultsController<QuoteItem>(fetchRequest: fetchRequest, managedObjectContext: self.context, sectionNameKeyPath: nil, cacheName: nil)
        
        // Configure Fetched Results Controller
        fetchedResultsController.delegate = self
        
        return fetchedResultsController
    }()
    
    @IBOutlet weak var tableView: NSTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createDummyData()
        
        do {
            try self.fetchedResultsController.performFetch()
        } catch {
            fatalError("Error on loading table view")
        }
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.target = self
    }
    
    func createDummyData() {
        print("BP -1")
        
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
        
        
        print("BP 1")
        do {
            try context.save()
        } catch let error as NSError {
            print("Error saving: \(error), \(error.userInfo)")
        }
        
        print("BP 2")
        
        let fetchRequest: NSFetchRequest<CustomItem> = CustomItem.createFetchRequest()
        let items = try! context.fetch(fetchRequest)
        items.forEach {
            print("\($0.name): \($0.subtotal)")
        }
        
        print("BP 3")
    }
    
}

extension QuoteListViewController: NSTableViewDataSource {

    func numberOfRows(in tableView: NSTableView) -> Int {
        return fetchedResultsController.fetchedObjects?.count ?? 0
    }

}

extension QuoteListViewController: NSTableViewDelegate {

    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        guard let cell = tableView.makeView(withIdentifier: QuoteItemCellView.identifier, owner: nil) as? QuoteItemCellView else {
            fatalError("Unexpected error on cell creation")
        }
        
        let item = fetchedResultsController.fetchedObjects![row]
        cell.textField?.stringValue = item.name!
        cell.subtotalField.stringValue = "\(item.subtotal)"
        
        return cell
    }

}

// Credit: https://samwize.com/2018/11/16/guide-to-nsfetchedresultscontroller-with-nstableview-macos/
extension QuoteListViewController: NSFetchedResultsControllerDelegate {
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
            case .insert:
                if let newIndexPath = newIndexPath {
                    tableView.insertRows(at: [newIndexPath.item], withAnimation: .effectFade)
                }
            case .delete:
                if let indexPath = indexPath {
                    tableView.removeRows(at: [indexPath.item], withAnimation: .effectFade)
                }
            case .update:
                if let indexPath = indexPath {
                    let row = indexPath.item
                    for column in 0..<tableView.numberOfColumns {
                        if let cell = tableView.view(atColumn: column, row: row, makeIfNecessary: true) as? QuoteItemCellView {
                            let item = fetchedResultsController.fetchedObjects![row]
                            cell.textField?.stringValue = item.name!
                            cell.subtotalField.stringValue = "\(item.subtotal)"
                        }
                    }
                    // tableView.reloadData(forRowIndexes: IndexSet(arrayLiteral: indexPath.item), columnIndexes: IndexSet(integer: 0))
                }
            case .move:
                if let indexPath = indexPath, let newIndexPath = newIndexPath {
                    tableView.removeRows(at: [indexPath.item], withAnimation: .effectFade)
                    tableView.insertRows(at: [newIndexPath.item], withAnimation: .effectFade)
                }
            @unknown default:
                fatalError("Unsupported operation")
        }
    }
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
        tableView.reloadData()
    }
    
}
