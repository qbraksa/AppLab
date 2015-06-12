//
//  ScrolViewViewController.m
//  AppLab
//
//  Created by Zakaria on 5/3/15.
//  Copyright (c) 2015 Zakaria. All rights reserved.
//

#import "ScrolViewViewController.h"

@interface ScrolViewViewController ()

@end

@implementation ScrolViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.scrollView.contentSize = CGSizeMake(320, 1000);
    UIView* view = [[UIView alloc] initWithFrame:CGRectMake(10, 10, 40, 40)];
    [view setBackgroundColor:[UIColor yellowColor]];
    [self.scrollView addSubview:view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
