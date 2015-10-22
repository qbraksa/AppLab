//
//  ViewController.h
//  AppLab
//
//  Created by Zakaria Braksa on 4/21/15.
//  Copyright (c) 2015 Zakaria Braksa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    UIDynamicAnimator* animator;
    UIView *square;
    UIAttachmentBehavior* attach;
    UICollisionBehavior* collision; 
}


@end

