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
            return [[NSString alloc] initWithData:xmlData encoding:NSUTF8StringEncoding];
        }else return @"";
    }
    return nil;
}

-(id)randomObject {
    if (self.count) {
        return self[arc4random_uniform((u_int32_t)self.count)];
    }
    return nil;
}

-(id)objectOrNilAtIndex:(NSUInteger)index {
    return index < self.count ? self[index] : nil;
}

-(NSString *)jsonStringEncoded {
    if ([NSJSONSerialization isValidJSONObject:self]) {
        NSError *error = nil;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:0 error:&error];
        NSString *json = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        if (!error) {
            return json;
        }
    }
    return nil;
}

-(NSString *)jsonPrettyStringEncoded {
    if ([NSJSONSerialization isValidJSONObject:self]) {
        NSError *error = nil;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:&error];
        NSString *json = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        if (!error) {
            return json;
        }
    }
    return nil;
}

@end


@implementation NSMutableArray (LQAdd)

+ (NSMutableArray *)arrayWithPlistData:(NSData *)plist {
    if (!plist) return nil;
    NSMutableArray *array = [NSPropertyListSerialization propertyListWithData:plist
                                                                      options:NSPropertyListMutableContainersAndLeaves format:NULL error:NULL];
    if ([array isKindOfClass:[NSMutableArray class]]) return array;
    return nil;
}

+ (NSMutableArray *)arrayWithPlistString:(NSString *)plist {
    if (!plist) return nil;
    NSData *data = [plist dataUsingEncoding:NSUTF8StringEncoding];
    return [self arrayWithPlistData:data];
}

- (void)removeFirstObject {
    if (self.count) {
        [self removeObjectAtIndex:0];
    }
}

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"
- (void)removeLastObject {
    if (self.count) {
        [self removeObjectAtIndex:self.count-1];
    }
}
#pragma clang diagnostic pop

- (id)popFirstObject {
    id obj = nil;
    if (self.count) {
        obj = self.firstObject;
        [self removeObjectAtIndex:0];
    }
    return obj;
}

- (id)popLastObject {
    id obj = nil;
    if (self.count) {
        obj = self.lastObject;
        [self removeObjectAtIndex:self.count-1];
    }
    return obj;
}

@end

