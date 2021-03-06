//
//  JSONUtility.m
//  Jccp
//
//  Created by Gary on 13-12-5.
//
//

#import "JSONUtility.h"

@implementation JSONUtility

+ (id)objectFromJSONString:(NSString *)jsonString
{
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];

    return [self objectFromJSONData:jsonData];
}

+ (id)objectFromJSONData:(NSData *)jsonData
{
    NSError *error = nil;
    id      result = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:&error];

    if (error) {
        NSLog(@"%s %@", __FUNCTION__, error);
        return nil;
    }

    return result;
}

+ (NSString *)JSONStringFromObject:(id)object
{
    NSError *error = nil;
    NSData  *result = [NSJSONSerialization dataWithJSONObject:object options:NSJSONWritingPrettyPrinted error:&error];

    if (error) {
        NSLog(@"%s %@", __FUNCTION__, error);
        return nil;
    }

    NSString *resultString = [[NSString alloc] initWithData:result encoding:NSUTF8StringEncoding];

#if !__has_feature(objc_arc)
        [resultString autorelease];
#endif

    return resultString;
}

@end