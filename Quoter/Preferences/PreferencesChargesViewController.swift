//
//  PreferencesChargesViewController.swift
//  Quoter
//
//  Created by Brandon Low on 3/5/20.
//  Copyright © 2020 Brandon Low. All rights reserved.
//

import Cocoa

class PreferencesChargesViewController: NSTabViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear() {
        super.viewDidAppear()
        self.parent?.view.window?.title = self.title!
    }
    
}
