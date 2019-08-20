//
//  QuoteListViewController.swift
//  Quoter
//
//  Created by Brandon Low on 8/18/19.
//  Copyright © 2019 Brandon Low. All rights reserved.
//

import Cocoa

class QuoteListViewController: NSViewController {
    
    @IBOutlet weak var tableView: NSTableView!
    var items: [QuoteItem] = [
        QuoteItemImpl(name: "Bindery", subtotal: 10000),
        QuoteItemImpl(name: "Orange", subtotal: 120547),
        QuoteItemImpl(name: "Banana", subtotal: 5817),
        QuoteItemImpl(name: "Test", subtotal: 96854),
        QuoteItemImpl(name: "asdf", subtotal: 068172)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.target = self
    }
    
}

extension QuoteListViewController: NSTableViewDataSource {
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: NSTableView, objectValueFor tableColumn: NSTableColumn?, row: Int) -> Any? {
        return items[row]
    }
    
}

extension QuoteListViewController: NSTableViewDelegate {
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        
        if row >= items.count {
            return nil
        }
        
        let item = items[row]
        
        if let cell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier("QuoteItem"), owner: nil) as? NSTableCellView {
            print("Requested item1 \(item.name)")
            cell.textField?.stringValue = item.name
            return cell
        }
        print("Requested item2 \(item.name)")
        
        return nil
    }
    
}
