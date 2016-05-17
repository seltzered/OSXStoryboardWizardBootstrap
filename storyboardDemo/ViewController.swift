
//
//  ViewController.swift
//  storyboardDemo
//
//  Created by Vivek Gani on 4/27/16.
//
// This sample is based on Mike Woelmer's iOS tutorial on having storyboards with container / children views:
// https://spin.atomicobject.com/2015/09/02/switch-container-views/
// 
// It's been changed to apply for use on macOS, and so the previous/next buttons 
// are within the child views themselves for more customization (which suited my own needs better).
//

import Cocoa

class ViewController: NSViewController {
    @IBOutlet weak var containerView: NSView!
    weak var currentViewController: NSViewController?

    var currentViewControllerIdx = 0
    let childControllerIdentifiers = [
        "componentA",
        "componentB",
        "componentC",
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.currentViewControllerIdx = 0
        self.currentViewController = self.storyboard?.instantiateControllerWithIdentifier(childControllerIdentifiers[currentViewControllerIdx]) as? NSViewController
        self.currentViewController!.view.translatesAutoresizingMaskIntoConstraints = false
        self.addChildViewController(self.currentViewController!)
        self.addSubview(self.currentViewController!.view, toView:containerView)
        super.viewDidLoad()
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    func addSubview(subView:NSView, toView parentView:NSView) {
        parentView.addSubview(subView)
        var viewBindingsDict = [String: AnyObject]()
        viewBindingsDict["subView"] = subView
    
        parentView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[subView]|",
            options: [], metrics: nil, views: viewBindingsDict))
        parentView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[subView]|",
            options: [], metrics: nil, views: viewBindingsDict))
        
    }
    
    func transitionToNext() {
        let nextViewControllerIdx = currentViewControllerIdx + 1
        transitionToViewIdx(nextViewControllerIdx)
    }
    
    func transitionToPrevious() {
        let nextViewControllerIdx = currentViewControllerIdx - 1
        transitionToViewIdx(nextViewControllerIdx)
    }
    
    func transitionToViewIdx( nextViewControllerIdx: NSInteger )
    {
        if ((nextViewControllerIdx < 0) ||
            (nextViewControllerIdx > (childControllerIdentifiers.count - 1)) ) {
            NSLog("Error: no next view to transition to.")
            return
        }
        
        let nextViewController = self.storyboard?.instantiateControllerWithIdentifier(childControllerIdentifiers[nextViewControllerIdx]) as? NSViewController
        nextViewController!.view.translatesAutoresizingMaskIntoConstraints = false
        self.cycleFromViewController(self.currentViewController!, toViewController:nextViewController!)
        self.currentViewController = nextViewController
        
        currentViewControllerIdx = nextViewControllerIdx
    }
    
    func cycleFromViewController(oldViewController: NSViewController, toViewController newViewController: NSViewController) {
        oldViewController.viewWillDisappear()
        self.addChildViewController(newViewController)
        newViewController.viewWillAppear()
        self.addSubview(newViewController.view, toView:self.containerView!)
        newViewController.view.layoutSubtreeIfNeeded()
        
        oldViewController.view.removeFromSuperview()
        oldViewController.removeFromParentViewController()
        oldViewController.viewDidDisappear()
        newViewController.viewDidAppear()
    }
    
}

