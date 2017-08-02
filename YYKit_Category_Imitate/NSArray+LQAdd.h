//
//  NSArray+LQAdd.h
//  YYKit_Category_Imitate
//
//  Created by 李乾 on 2017/8/1.
//  Copyright © 2017年 liqian. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 Provide some common rethod for 'NSArray'.
 */
@interface NSArray (LQAdd)

/**
 Create and return an array from a specified property list data.
 
 @param plist A property list data whose root object is an array.
 @return A new array created from the binary plist data, or nil if an error occurs.
 */
+ (nullable NSArray *)arrayWithPlistData:(NSData *)plist;

/**
 Create and returns an array from a specified property list xml string.
 
 @param plist A property list xml string whose root object is an array.
 @return A new array created from the plist string, or nil if an error occurs.
 */
+ (nullable NSArray *)arrayWithPlistString:(NSString *)plist;

/**
 Serialize the array to a binary property list data.
 
 @return A binary plist data, or nil if error occurs.
 */
- (nullable NSData *)plistData;

/**
 Serialize the array to a xml property list string.
 
 @return A plist xml string, or nil if an error occurs
 */
- (nullable NSString *)plistString;








@end

NS_ASSUME_NONNULL_END
