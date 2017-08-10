//
//  CZDateUtility.h
//  Haoban
//
//  Created by ug19 on 16/4/18.
//  Copyright © 2016年 Ugood. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CZDateUtility : NSObject

/**
 *  计算从 fromDateStr 到现在相差的秒数
 *
 *  @param fromDateStr 需要计算时间差的日期字符串，格式为“yyyy-MM-dd HH:mm:ss”
 *
 *  @return 指定时间 fromDateStr 与当前时间的秒数差，fromDateStr 比当前时间早时，返回值为负数
 */
+ (NSTimeInterval)secondsFromDateByNow:(NSString *)fromDateStr;

/**
 *  对于与给定日期 fromDateStr 时间间隔的描述，如：1分钟前
 *
 *  @param fromDateStr 需要计算时间差的日期字符串，格式为“yyyy-MM-dd HH:mm:ss”
 *
 *  @return x秒钟前、x分钟前、x小时前；超过24小时，直接返回完整日期
 */
+ (NSString *)timeIntervalDescFromDateByNow:(NSString *)fromDateStr;
/**
 把秒数转换成时分秒
 
 @param totalSeconds 总秒数
 @param separator 时分秒的分隔符，如：:
 @param isStandard YES-如：01:01:01，NO-1:1:1
 @return 使用分隔符分隔的时分秒
 */
+ (NSString *)hmsFormatterFromSeconds:(NSInteger)totalSeconds withSeparator:(NSString *)separator usingStandardFormat:(BOOL)isStandard;

#pragma mark - 时间戳
/** 某个日期的时间戳 */
+ (NSString *)timeStampWithDate:(NSDate *)date;
/** 当前时间的时间戳 */
+ (NSString *)timeStampWithNowDate;
/** 将时间戳转换为 NSDate 日期 */
+ (NSDate *)dateFromTimeStamp:(NSString *)stamp;
/** 根据日期格式将时间戳转换为 NSString 日期字符串 */
+ (NSString *)dateStringFromTimeStamp:(NSString *)stamp withDateFormat:(NSString *)dateFormat;

#pragma mark - NSDate 和 NSString 互转
/** 根据 dateFormat 格式，把 NSString 日期转换为 NSDate */
+ (NSDate *)dateFromDateString:(NSString *)dateString dateFormat:(NSString *)dateFormat;
/** 根据 dateFormat 格式，把 NSDate 日期转换为 NSString */
+ (NSString *)dateStringFromDate:(NSDate *)date dateFormat:(NSString *)dateFormat;

@end
