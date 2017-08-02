//
//  NSArray+LQAdd.m
//  YYKit_Category_Imitate
//
//  Created by 李乾 on 2017/8/1.
//  Copyright © 2017年 liqian. All rights reserved.
//

#import "NSArray+LQAdd.h"

@implementation NSArray (LQAdd)

+ (NSArray *)arrayWithPlistData:(NSData *)plist {
    if (!plist) return nil;
    // What's NSPropertyListSerialization ?
    NSArray *array = [NSPropertyListSerialization propertyListWithData:plist
                                                               options:NSPropertyListImmutable
                                                                format:NULL
                                                                 error:NULL];
    if ([array isKindOfClass:[NSArray class]]) return array;
    return nil;
}

+ (NSArray *)arrayWithPlistString:(NSString *)plist {
    if (!plist) return nil;
    NSData *data = [plist dataUsingEncoding:NSUTF8StringEncoding];
    return [self arrayWithPlistData:data];
}

- (NSData *)plistData {
    return [NSPropertyListSerialization dataWithPropertyList:self
                                                      format:NSPropertyListBinaryFormat_v1_0
                                                     options:kNilOptions
                                                       error:NULL];
}

- (NSString *)plistString {
    NSData *xmlData = [self plistData];
    if (xmlData) {
        if (xmlData.length) {
            return []
        }
    }
}

@end
