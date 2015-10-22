//
//  FrameMovesVC.m
//  AppLab
//
//  Created by Zakaria Braksa on 4/27/15.
//  Copyright (c) 2015 Zakaria Braksa. All rights reserved.
//

#import "LeftMenuVC.h"

@interface LeftMenuVC ()

@end

@implementation LeftMenuVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(void)viewDidAppear:(BOOL)animated{
    self.width = 150;
    self.firstView = [[UIView alloc] initWithFrame:CGRectMake(-_width, 0 , _width, self.view.bounds.size.height)];
    self.firstView.backgroundColor = [UIColor redColor];
    self.secondView = [[UIView alloc] initWithFrame:CGRectMake(0, 0 , 30,30)];
    self.secondView.backgroundColor = [UIColor yellowColor];
    
    [self.view addSubview:self.firstView];
    //[self.firstView addSubview:self.secondView];
    
    
    [self logGeometry:self.firstView];
    _isVisible = NO;
}

-(void)viewWillDisappear:(BOOL)animated{
    [self.firstView setHidden:YES];
    [self.secondView setHidden:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)logGeometry:(UIView*)view{
    CGSize boundsSize = view.bounds.size;
    CGPoint boundsOrigin = view.bounds.origin;
    NSLog(@"boundsOrigin: %@ \n boundsSize: %@",NSStringFromCGPoint(boundsOrigin), NSStringFromCGSize(boundsSize));
    
    CGSize frameSize = view.frame.size;
    CGPoint frameOrigin = view.frame.origin;
    NSLog(@"frameOrigin: %@ \n frameSize: %@",NSStringFromCGPoint(frameOrigin), NSStringFromCGSize(frameSize));
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)toggleView:(id)sender {
    
    if (_isVisible == YES) {
        UIView* v = self.firstView;
        CGRect newFrame = CGRectMake(v.frame.origin.x - _width, v.frame.origin.y, v.frame.size.width, v.frame.size.height);
        
        void (^animations)() = ^{
            v.frame = newFrame;
        };
        
        CGFloat animationDuration = 0.25f;
        
        [UIView animateWithDuration:animationDuration
                              delay:0
                            options:kNilOptions
                         animations:animations
                         completion:nil];
        
        [self logGeometry:self.firstView];
        _isVisible = NO;
    }else{
        UIView* v = self.firstView;
        CGRect newFrame = CGRectMake(v.frame.origin.x + _width, v.frame.origin.y, v.frame.size.width, v.frame.size.height);
        
        void (^animations)() = ^{
            v.frame = newFrame;
        };
        
        CGFloat animationDuration = 0.25f;
        
//        [UIView animateWithDuration:animationDuration
//                              delay:0
//                            options:kNilOptions
//                         animations:animations
//                         completion:nil];
        [UIView animateWithDuration:animationDuration delay:0 options:UIViewAnimationOptionTransitionNone animations:animations completion:nil];
        
        [self logGeometry:self.firstView];
        _isVisible = YES;
    }
    
}

@end
