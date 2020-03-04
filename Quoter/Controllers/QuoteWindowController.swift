//
//  QuoteWindowController.swift
//  Quoter
//
//  Created by Brandon Low on 8/18/19.
//  Copyright © 2019 Brandon Low. All rights reserved.
//

import Cocoa

class QuoteWindowController: NSWindowController {
    
    var contentVC: NSSplitViewController?
    
    convenience init(representedObject: QuoteData) {
        let splitVC = NSSplitViewController()
        let quoteListVC = QuoteListViewController()
        let quoteItemVC = BasicItemViewController()
        
        splitVC.representedObject = representedObject
        quoteListVC.representedObject = representedObject
        quoteItemVC.representedObject = representedObject
        
        splitVC.addSplitViewItem(NSSplitViewItem(contentListWithViewController: quoteListVC))
        splitVC.addSplitViewItem(NSSplitViewItem(viewController: quoteItemVC))
        
        print("Before window init")
        
        self.init(window: NSWindow(contentViewController: splitVC))
        
        self.contentVC = splitVC
    }

//    override func windowDidLoad() {
//        super.windowDidLoad()
//
//        let splitVC = NSSplitViewController()
//        let quoteListVC = QuoteListViewController()
//        let quoteItemVC = BasicItemViewController()
//
//        splitVC.addSplitViewItem(NSSplitViewItem(contentListWithViewController: quoteListVC))
//        splitVC.addSplitViewItem(NSSplitViewItem(viewController: quoteItemVC))
//
//        window?.contentViewController = splitVC
//    }

}
