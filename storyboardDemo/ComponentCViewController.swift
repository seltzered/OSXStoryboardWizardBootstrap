//
//  ComponentCViewController.swift
//  storyboardDemo
//
//  Created by Vivek Gani on 4/28/16.
//  Copyright © 2016 Vivek Gani. All rights reserved.
//

import Cocoa

class ComponentCViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    @IBAction func previousButtonClicked(sender: AnyObject) {
        let parentViewController = self.parentViewController as? ViewController
        parentViewController!.transitionToPrevious()
    }
    
    @IBAction func finishButtonClicked(sender: AnyObject) {
        self.view.window!.close()
    }
    
    
    
}
