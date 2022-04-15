//
//  NSDate+Timestamp.m
//  DailyPaper
//
//  Created by cheeseTunaFish on 2022/3/19.
//

#import "NSDate+Timestamp.h"

@implementation NSDate (Timestamp)

+ (NSInteger) nowTimestamp{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"哈哈哈哈哈哈哈哈哈哈"];
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    [formatter setTimeZone:timeZone];
    NSDate *datenow = [NSDate date];
    return [datenow timeIntervalSince1970];
    
}

@end
