//
//  LQCGUtilities.m
//  YYKit_Category_Imitate
//
//  Created by 李乾 on 2017/7/31.
//  Copyright © 2017年 liqian. All rights reserved.
//

#import "LQCGUtilities.h"
#import <Accelerate/Accelerate.h> // What's this ?

UIViewContentMode LQCAGravityToUIViewContentMode(NSString *gravity) {
    static NSDictionary *dict;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dict = @{ kCAGravityCenter : @(UIViewContentModeCenter),
                  kCAGravityTop : @(UIViewContentModeTop),
                  kCAGravityBottom : @(UIViewContentModeBottom),
                  kCAGravityLeft : @(UIViewContentModeLeft),
                  kCAGravityRight:@(UIViewContentModeRight),
                  kCAGravityTopLeft:@(UIViewContentModeTopLeft),
                  kCAGravityTopRight:@(UIViewContentModeTopRight),
                  kCAGravityBottomLeft:@(UIViewContentModeBottomLeft),
                  kCAGravityBottomRight:@(UIViewContentModeBottomRight),
                  kCAGravityResize:@(UIViewContentModeScaleToFill),
                  kCAGravityResizeAspect:@(UIViewContentModeScaleAspectFit),
                  kCAGravityResizeAspectFill:@(UIViewContentModeScaleAspectFill)
                 };
    });
    if (!gravity) return UIViewContentModeScaleToFill;
    return (UIViewContentMode)((NSNumber *)dict[gravity]).integerValue;
}
