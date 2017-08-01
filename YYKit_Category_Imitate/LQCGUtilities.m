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

NSString *LQUIViewContentModeToCAGravity(UIViewContentMode contentMode) {
    switch (contentMode) {
        case UIViewContentModeScaleToFill: return kCAGravityResize;
        case UIViewContentModeScaleAspectFit: return kCAGravityResizeAspect;
        case UIViewContentModeScaleAspectFill: return kCAGravityResizeAspectFill;
        case UIViewContentModeRedraw: return kCAGravityResize;
        case UIViewContentModeCenter: return kCAGravityCenter;
        case UIViewContentModeTop: return kCAGravityTop;
        case UIViewContentModeBottom: return kCAGravityBottom;
        case UIViewContentModeLeft: return kCAGravityLeft;
        case UIViewContentModeRight: return kCAGravityRight;
        case UIViewContentModeTopLeft: return kCAGravityTopLeft;
        case UIViewContentModeTopRight: return kCAGravityTopRight;
        case UIViewContentModeBottomLeft: return kCAGravityBottomLeft;
        case UIViewContentModeBottomRight: return kCAGravityBottomRight;
        default: return kCAGravityResize;
    }
}
















