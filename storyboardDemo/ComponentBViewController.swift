//
//  ComponentBViewController.swift
//  storyboardDemo
//
//  Created by Vivek Gani on 4/28/16.
//  Copyright © 2016 Vivek Gani. All rights reserved.
//

import Cocoa

class ComponentBViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    @IBAction func previousButtonClicked(sender: AnyObject) {
        let parentViewController = self.parentViewController as? ViewController
        parentViewController!.transitionToPrevious()
    }

    @IBAction func nextButtonClicked(sender: AnyObject) {
        let parentViewController = self.parentViewController as? ViewController
        parentViewController!.transitionToNext()
    }

}
