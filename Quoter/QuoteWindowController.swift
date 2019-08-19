//
//  QuoteWindowController.swift
//  Quoter
//
//  Created by Brandon Low on 8/18/19.
//  Copyright © 2019 Brandon Low. All rights reserved.
//

import Cocoa

class QuoteWindowController: NSWindowController {

    override func windowDidLoad() {
        super.windowDidLoad()
    
        let splitVC = NSSplitViewController()
        let quoteListVC = QuoteListViewController()
        let quoteItemVC = QuoteItemViewController()
        
        splitVC.addSplitViewItem(NSSplitViewItem(contentListWithViewController: quoteListVC))
        splitVC.addSplitViewItem(NSSplitViewItem(viewController: quoteItemVC))
        
        window?.contentViewController = splitVC
    }

}
