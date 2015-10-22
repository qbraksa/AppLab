//
//  Delegate.swift
//  AppLab
//
//  Created by Zakaria Braksa on 6/20/15.
//  Copyright (c) 2015 Zakaria Braksa. All rights reserved.
//

import UIKit

class BKDelegate : UIViewController {

    @IBOutlet weak var counterLabel: UILabel!
    
    
    override func viewDidLoad() {
        self.counterLabel.text = "0";
    }

    func updateCounter(){
        let counterLabelString = self.counterLabel.text
        let counterValue = Int(counterLabelString!)
        self.counterLabel.text = "\(counterValue! + 1)"
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        (segue.destinationViewController as! BKDelegator).delegate = self
    }
    
}