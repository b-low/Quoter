//
//  PreferencesPaperViewController.swift
//  Quoter
//
//  Created by Brandon Low on 3/5/20.
//  Copyright © 2020 Brandon Low. All rights reserved.
//

import Cocoa

class PreferencesPaperViewController: NSTabViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        preferredContentSize = view.fittingSize
    }
    
// Automatic resize based on tab selected
//    override func viewWillAppear() {
//        super.viewWillAppear()
//        preferredContentSize = view.fittingSize
//    }
    
    override func viewDidAppear() {
        super.viewDidAppear()
        self.parent?.view.window?.title = self.title!
    }
    
}
