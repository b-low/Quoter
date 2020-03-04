//
//  QuoteListViewController.swift
//  Quoter
//
//  Created by Brandon Low on 8/18/19.
//  Copyright © 2019 Brandon Low. All rights reserved.
//

import Cocoa

class QuoteListViewController: NSViewController {
    
    @IBOutlet var arrayController: NSArrayController!
    @objc dynamic var items = [QuoteItem]()
    
    @IBOutlet weak var tableView: NSTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createDummyData()
        
        
//        tableView.delegate = self
//        tableView.dataSource = self
//        tableView.target = self
    }
    
    func createDummyData() {
        items.append(CustomItem(itemType: "custom", name: "Bindery", subtotal: 100000, quantity: 1))
        items.append(CustomItem(itemType: "custom", name: "Orange", subtotal: 120547, quantity: 4))
        items.append(CustomItem(itemType: "custom", name: "Banana", subtotal: 5817, quantity: 1))
        items.append(CustomItem(itemType: "custom", name: "Test", subtotal: 96854, quantity: 2))
        items.append(CustomItem(itemType: "custom", name: "asdf", subtotal: 068172, quantity: 5))
        
        for item in arrayController.arrangedObjects as! [QuoteItem] {
            print("\(item.name): \(item.subtotal)")
        }
    }
    
}

//extension QuoteListViewController: NSTableViewDataSource {
//
//    func numberOfRows(in tableView: NSTableView) -> Int {
//        return (quoteItems.arrangedObjects as! [QuoteItem]).count
//    }
//
//}
//
//extension QuoteListViewController: NSTableViewDelegate {
//
//    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
//        guard let cell = tableView.makeView(withIdentifier: QuoteItemCellView.identifier, owner: nil) as? QuoteItemCellView else {
//            fatalError("Unexpected error on cell creation")
//        }
//
//        let item = quoteItems.arrangedObjects[row]
//        cell.textField?.stringValue = item.name
//        cell.subtotalField.stringValue = "\(item.subtotal)"
//
//        return cell
//    }
//
//}
//
//// Credit: https://samwize.com/2018/11/16/guide-to-nsfetchedresultscontroller-with-nstableview-macos/
//extension QuoteListViewController: NSFetchedResultsControllerDelegate {
//
//    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
//        switch type {
//            case .insert:
//                if let newIndexPath = newIndexPath {
//                    tableView.insertRows(at: [newIndexPath.item], withAnimation: .effectFade)
//                }
//            case .delete:
//                if let indexPath = indexPath {
//                    tableView.removeRows(at: [indexPath.item], withAnimation: .effectFade)
//                }
//            case .update:
//                if let indexPath = indexPath {
//                    let row = indexPath.item
//                    for column in 0..<tableView.numberOfColumns {
//                        if let cell = tableView.view(atColumn: column, row: row, makeIfNecessary: true) as? QuoteItemCellView {
//                            let item = items[row]
//                            cell.textField?.stringValue = item.name
//                            cell.subtotalField.stringValue = "\(item.subtotal)"
//                        }
//                    }
//                    // tableView.reloadData(forRowIndexes: IndexSet(arrayLiteral: indexPath.item), columnIndexes: IndexSet(integer: 0))
//                }
//            case .move:
//                if let indexPath = indexPath, let newIndexPath = newIndexPath {
//                    tableView.removeRows(at: [indexPath.item], withAnimation: .effectFade)
//                    tableView.insertRows(at: [newIndexPath.item], withAnimation: .effectFade)
//                }
//            @unknown default:
//                fatalError("Unsupported operation")
//        }
//    }
//
//    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
//        tableView.beginUpdates()
//    }
//
//    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
//        tableView.endUpdates()
//        tableView.reloadData()
//    }
//
//}
