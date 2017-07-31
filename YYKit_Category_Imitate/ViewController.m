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
    
    CGFloat left = self.view.layer.left;
    self.view.layer.left = 5;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
