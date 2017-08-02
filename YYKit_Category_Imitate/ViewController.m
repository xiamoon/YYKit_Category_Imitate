//
//  ViewController.m
//  YYKit_Category_Imitate
//
//  Created by 李乾 on 2017/7/31.
//  Copyright © 2017年 liqian. All rights reserved.
//

#import "ViewController.h"
#import "CALayer+LQAdd.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CALayer *layer = [CALayer layer];
    layer.bounds = CGRectMake(0, 0, 100, 100);
    layer.position = CGPointMake(150, 100);
    UIImage *image = [UIImage imageNamed:@"1.jpg"];
    layer.contents = (id)image.CGImage;
    [self.view.layer addSublayer:layer];
    
    // Change layer's contents.
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        UIImage *image = [UIImage imageNamed:@"2.jpg"];
        layer.contents = (id)image.CGImage;
        [layer addFadeAnimationWithDuration:2.5 curve:UIViewAnimationCurveEaseInOut];
    });
    
    
    CALayer *layer2 = [CALayer layer];
    layer2.bounds = CGRectMake(0, 0, 100, 100);
    layer2.position = CGPointMake(150, 250);
    layer2.contents = (id)image.CGImage;
    [self.view.layer addSublayer:layer2];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        layer2.transformRotation = M_PI*(1.0/3);  // Animated.
    });
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
