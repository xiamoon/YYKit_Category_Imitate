//
//  CALayer+LQAdd.h
//  YYKit_Category_Imitate
//
//  Created by 李乾 on 2017/7/31.
//  Copyright © 2017年 liqian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

/**
 Provides extensions for 'CALayer'.
 */
@interface CALayer (LQAdd)

/**
 Take snapshot without transform, image's size equals to bounds.
 */
- (nullable UIImage *)snapshotImage;

/**
 Take snapshot without transform, PDF's size equals to bounds.
 */
- (nullable NSData *)snapshotPDF;

/**
 Shortcut to set the layer's shadow
 
 @param color Shadow color
 @param offset Shadow offset
 @param radius Shadow radius
 */
- (void)setLayerShadow:(nullable UIColor *)color offset:(CGSize)offset radius:(CGFloat)radius;

/**
 Remove all sublayers.
 */
- (void)removeAllSublayers;

// 分类可以添加属性，但是要自己实现-setter和-getter方法。
@property (nonatomic) CGFloat left;
@property (nonatomic) CGFloat top;
@property (nonatomic) CGFloat right;
@property (nonatomic) CGFloat bottom;

@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat height;
@property (nonatomic) CGFloat center;
@property (nonatomic) CGFloat centerX;
@property (nonatomic) CGFloat centerY;
@property (nonatomic) CGFloat origin;
@property (nonatomic, getter=frameSize, setter=setFrameSize:) CGSize size;


@property (nonatomic) CGFloat transformRotation;
@property (nonatomic) CGFloat transformRotationX;
@property (nonatomic) CGFloat transformRotationY;
@property (nonatomic) CGFloat transformRotationZ;
@property (nonatomic) CGFloat transformScale;
@property (nonatomic) CGFloat transformScaleX;
@property (nonatomic) CGFloat transformScaleY;
@property (nonatomic) CGFloat transformScaleZ;
@property (nonatomic) CGFloat transformTranslationX;
@property (nonatomic) CGFloat transformTranslationY;
@property (nonatomic) CGFloat transformTranslationZ;

/**
 Shortcut for transfrom.m34, -1/1000 is a good value.
 It should be set before other transform shortcut.
 */
@property (nonatomic) CGFloat transformDepth;

/**
 Wrapper for 'contentsGravity' property.
 */
@property (nonatomic) UIViewContentMode contentMode;




@end
