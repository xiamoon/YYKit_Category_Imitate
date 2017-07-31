//
//  CALayer+LQAdd.m
//  YYKit_Category_Imitate
//
//  Created by 李乾 on 2017/7/31.
//  Copyright © 2017年 liqian. All rights reserved.
//

#import "CALayer+LQAdd.h"
#import "LQCGUtilities.h"

@implementation CALayer (LQAdd)

-(UIImage *)snapshotImage {
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.opaque, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self renderInContext:context]; // Key: render self into current context.
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

-(NSData *)snapshotPDF {
    CGRect bounds = self.bounds;
    NSMutableData *data = [NSMutableData data];
    // CGDataConsumerRef ?
    CGDataConsumerRef consumer = CGDataConsumerCreateWithCFData((__bridge CFMutableDataRef)data);
    CGContextRef context = CGPDFContextCreate(consumer, &bounds, NULL);
    CGDataConsumerRelease(consumer);
    if (!context) return nil;
    CGPDFContextBeginPage(context, NULL);
    CGContextTranslateCTM(context, 0, bounds.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    [self renderInContext:context]; // Key: render self into current context.
    CGPDFContextEndPage(context);
    CGPDFContextClose(context);
    CGContextRelease(context);
    return data;
}

-(void)setLayerShadow:(UIColor *)color offset:(CGSize)offset radius:(CGFloat)radius {
    self.shadowColor = color.CGColor;
    self.shadowOffset = offset;
    self.shadowRadius = radius;
    self.shadowOpacity = 1;
    self.shouldRasterize = YES;
    self.rasterizationScale = [UIScreen mainScreen].scale;
}

-(void)removeAllSublayers {
    while (self.sublayers.count) {
        [self.sublayers.lastObject removeFromSuperlayer];
    }
}


-(CGFloat)left {
    return self.frame.origin.x;
}

-(void)setLeft:(CGFloat)left {
    CGRect frame = self.frame;
    frame.origin.x = left;
    self.frame = frame;
}
//...


// transform.rotation ?? to x? y? z?
// 我们用layer的属性只能访问到 layer.transform这一层
-(CGFloat)transformRotation {
    NSNumber *v = [self valueForKeyPath:@"transform.rotation"];
    return v.doubleValue;
}

-(void)setTransformRotation:(CGFloat)v {
    [self setValue:@(v) forKeyPath:@"transform.rotation"];
}

-(CGFloat)transformScaleX {
    NSNumber *v = [self valueForKeyPath:@"transform.rotation.x"];
    return v.doubleValue;
}

-(void)setTransformRotationX:(CGFloat)v {
    [self setValue:@(v) forKeyPath:@"transform.rotation.x"];
}
//...


- (CGFloat)transformTranslationX {
    NSNumber *v = [self valueForKeyPath:@"transform.translation.x"];
    return v.doubleValue;
}

- (void)setTransformTranslationX:(CGFloat)v {
    [self setValue:@(v) forKey:@"transform.translation.x"];
}

-(CGFloat)transformDepth {
    // Learn about CATransfrom3D.
    return self.transform.m34;
}

-(void)setTransformDepth:(CGFloat)v {
    CATransform3D d = self.transform;
    d.m34 = v;
    self.transform = d;
}

-(UIViewContentMode)contentMode {
    return LQCAGravityToUIViewContentMode(self.contentsGravity);
}

-(void)setContentMode:(UIViewContentMode)contentMode {
    //...
}









@end
