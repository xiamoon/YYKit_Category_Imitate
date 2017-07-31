//
//  LQCGUtilities.h
//  YYKit_Category_Imitate
//
//  Created by 李乾 on 2017/7/31.
//  Copyright © 2017年 liqian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

#ifdef __cplusplus
#define LQ_EXTERN_C_BEGIN extern "C" {
#define LQ_EXTERN_C_END   }
#else
#define LQ_EXTERN_C_BEGIN
#define LQ_EXTERN_C_END
#endif


LQ_EXTERN_C_BEGIN
NS_ASSUME_NONNULL_BEGIN

UIViewContentMode LQCAGravityToUIViewContentMode(NSString *gravity);



NS_ASSUME_NONNULL_END
