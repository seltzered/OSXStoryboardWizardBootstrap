//
//  ComponentAViewController.swift
//  storyboardDemo
//
//  Created by Vivek Gani on 4/28/16.
//  Copyright © 2016 Vivek Gani. All rights reserved.
//

import Cocoa

class ComponentAViewController: NSViewController {
    
    @IBOutlet weak var quitButton: NSButton!
    @IBOutlet weak var nextButton: NSButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    
    }
    
    @IBAction func quitButtonClicked(sender: AnyObject) {
  
        NSApplication.sharedApplication().terminate(self)
        
    }
    
    
    @IBAction func nextButtonClicked(sender: AnyObject) {
        
        let parentViewController = self.parentViewController as? ViewController
        parentViewController!.transitionToNext()
        
    }
    
}
