//
//  PreferencesViewController.swift
//  Quoter
//
//  Created by Brandon Low on 3/3/20.
//  Copyright © 2020 Brandon Low. All rights reserved.
//

import Cocoa

class PreferencesViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear() {
        super.viewDidAppear()
        
        self.parent?.view.window?.title = self.title!
    }
}
