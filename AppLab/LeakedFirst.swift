//
//  LeakedFirst.swift
//  AppLab
//
//  Created by Zakaria Braksa on 9/7/15.
//  Copyright (c) 2015 Zakaria Braksa. All rights reserved.
//

import UIKit

class LeakedFirst : UIViewController {
    
    var someView : UIView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let anotherView = UIView()
        someView = anotherView
    }
    
    @IBAction func dismissVC(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
