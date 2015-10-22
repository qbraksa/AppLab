//
//  FrameMovesVC.h
//  AppLab
//
//  Created by Zakaria Braksa on 4/27/15.
//  Copyright (c) 2015 Zakaria Braksa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LeftMenuVC : UIViewController

@property (assign, nonatomic) BOOL isVisible;
@property (assign, nonatomic) CGFloat width;
@property (strong, nonatomic) UIView* firstView;
@property (strong, nonatomic) UIView* secondView;

- (IBAction)toggleView:(id)sender;

@end
