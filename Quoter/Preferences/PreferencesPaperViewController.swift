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
        
        // Automatic resize based on tab selected
        // preferredContentSize = view.fittingSize
    }
    
    override func viewDidAppear() {
        super.viewDidAppear()
        self.parent?.view.window?.title = self.title!
    }
    
}
