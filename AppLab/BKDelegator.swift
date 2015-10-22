//
//  BKDelegator.swift
//  AppLab
//
//  Created by Zakaria Braksa on 6/20/15.
//  Copyright (c) 2015 Zakaria Braksa. All rights reserved.
//

import UIKit

class BKDelegator : UIViewController {
    
    var delegate : BKDelegate?
    
    
    @IBAction func updateCounter(sender: AnyObject) {
        self.delegate?.updateCounter()
    }
    
    
}