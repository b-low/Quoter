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
        CustomItem(name: "Bindery", subtotal: 10000),
        CustomItem(name: "Orange", subtotal: 120547),
        CustomItem(name: "Banana", subtotal: 5817),
        CustomItem(name: "Test", subtotal: 96854),
        CustomItem(name: "asdf", subtotal: 068172)
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
        
        if let cell = tableView.makeView(withIdentifier: QuoteItemCellView.identifier, owner: nil) as? QuoteItemCellView {
            cell.textField?.stringValue = item.name
            cell.subtotalField.stringValue = item.subtotalDisplay
            return cell
        }
        print("Requested item2 \(item.name)")
        
        return nil
    }
    
}
