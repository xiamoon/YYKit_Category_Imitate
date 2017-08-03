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

/**
 Returns the object located at a random index.
 
 @return The object in the array with a random index value.
 If the array is empty, returns nil.
 */
- (nullable id)randomObject;

/**
 Return the object located at index, or return nil when out of bounds.
 It's similar to 'objectAtIndex:', but it never throw exception.
 
 @param index The object located at index.
 */
- (nullable id)objectOrNilAtIndex:(NSUInteger)index;

/**
 Convert object to json string. return nil if an error occurs.
 NSString/NSNumber/NSDictionary/NSArray
 */
- (nullable NSString *)jsonStringEncoded;

/**
 Convert object to json string formatted. return nil if an error occurs.
 */
- (nullable NSString *)jsonPrettyStringEncoded;

@end


/**
 Provide some commom method for 'NSMutableArray'.
 */
@interface NSMutableArray (LQAdd)

/**
 Create and returns an array from a specified property list data.
 
 @param plist A property list data whose root object is an array.
 @return A new array created from the binary plist data, or nil if an error occurs.
 */
+ (nullable NSMutableArray *)arrayWithPlistData:(NSData *)plist;

/**
 Create and returns an array from a specified property list xml string.
 
 @param plist A property list xml string whose root object is an array.
 @return A new array created from the plist string, or nil if an error occurs.
 */
+ (nullable NSMutableArray *)arrayWithPlistString:(NSString *)plist;

- (void)removeFirstObject;

- (void)removeLastObject;

/**
 Remove and returns the object with the highest-valued index in the array.
 If the array is empty, it just returns nil.
 
 @return  The first object, or nil.
 */
- (nullable id)popFirstObject;

- (nullable id)popLastObject;

@end



NS_ASSUME_NONNULL_END
