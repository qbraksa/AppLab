//
//  ViewController.m
//  AppLab
//
//  Created by Zakaria on 4/21/15.
//  Copyright (c) 2015 Zakaria. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    square = [[UIView alloc] initWithFrame:CGRectMake(45,45,45,45)];
    square.backgroundColor = [UIColor redColor];
    [self.view addSubview:square];
    
    UIPanGestureRecognizer* panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panning:)];
    
    [square addGestureRecognizer:panGesture];
    
    collision = [[UICollisionBehavior alloc] initWithItems:@[square]];
    collision.translatesReferenceBoundsIntoBoundary = YES;
    [animator addBehavior:collision];
    
}

-(void)panning:(UIPanGestureRecognizer*) pan{

    // println("Our box is panning")
    CGPoint location = [pan locationInView:self.view];
    CGPoint touchLocation = [pan locationInView:square];
    
    if (pan.state == UIGestureRecognizerStateBegan) {
        
        // Remove all previous behaviors
        [animator removeAllBehaviors];
        
        // Instantiate attachement behavior
        UIOffset offset = UIOffsetMake(touchLocation.x - CGRectGetMidX(square.bounds), touchLocation.y - CGRectGetMidY(square.bounds));
        attach = [[UIAttachmentBehavior alloc] initWithItem:square offsetFromCenter:offset attachedToAnchor:location];
        
        // Add it
        [animator addBehavior:attach];
        
    } else if (pan.state == UIGestureRecognizerStateChanged) {
        attach.anchorPoint = location;
        
    } else if (pan.state == UIGestureRecognizerStateEnded) {
        // Remove attach behavior
        [animator removeBehavior:attach];
        
        // Customize Item Behavior
        //UIDynamicItemBehavior* itemBehavior = UIDynamicItemBehavior(items: [boxView])
        UIDynamicItemBehavior* itemBehavior = [[UIDynamicItemBehavior alloc] initWithItems:@[square]];
        [itemBehavior addLinearVelocity:[pan velocityInView:self.view] forItem:square];
        [itemBehavior setAngularResistance:0];
        [itemBehavior setElasticity:0.8];
        
        [animator addBehavior:itemBehavior];
        [animator addBehavior:collision];

    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
