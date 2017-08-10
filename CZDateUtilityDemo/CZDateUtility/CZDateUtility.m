//
//  CZDateUtility.m
//  Haoban
//
//  Created by ug19 on 16/4/18.
//  Copyright © 2016年 Ugood. All rights reserved.
//

#import "CZDateUtility.h"

@implementation CZDateUtility

+ (NSTimeInterval)secondsFromDateByNow:(NSString *)fromDateStr {
	NSDateFormatter *fromDateFmt = [[NSDateFormatter alloc] init];
	fromDateFmt.dateFormat = @"yyyy-MM-dd HH:mm:ss";
	NSDate *fromDate = [fromDateFmt dateFromString:fromDateStr];
	NSTimeInterval interval = fromDate.timeIntervalSinceNow;
	return interval;
}

+ (NSString *)timeIntervalDescFromDateByNow:(NSString *)fromDateStr {
	NSDateFormatter *dateFormat = [NSDateFormatter new];
	[dateFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
	NSDate *date = [dateFormat dateFromString:fromDateStr];
	double timeInterval = [date timeIntervalSinceNow];
	if (-60 < timeInterval) {
		return [NSString stringWithFormat:@"%d秒钟前", (int)-timeInterval];
	}
	else if (-60 * 60 < timeInterval && timeInterval <= -60) {
		return [NSString stringWithFormat:@"%d分钟前", (int)-timeInterval / 60];
	}
	else if (-24 * 60 * 60 < timeInterval && timeInterval <= -60 * 60) {
		return [NSString stringWithFormat:@"%d小时前", (int)-timeInterval / 3600];
	}
	else {
		return fromDateStr;
	}
}

+ (NSString *)hmsFormatterFromSeconds:(NSInteger)totalSeconds withSeparator:(NSString *)separator usingStandardFormat:(BOOL)isStandard {
    NSInteger seconds = totalSeconds % 60;
    NSInteger minutes = (totalSeconds / 60) % 60;
    NSInteger hours = totalSeconds / (60 * 60);
    NSString *hmsStr;
    if (isStandard) {   // 01:01:01
        if (hours > 0) {
            hmsStr = [NSString stringWithFormat:@"%02ld%@%02ld%@%02ld", (long)hours, separator, (long)minutes, separator, (long)seconds];
        } else if (minutes > 0) {
            hmsStr = [NSString stringWithFormat:@"%02ld%@%02ld", (long)minutes, separator, (long)seconds];
        } else {
            hmsStr = [NSString stringWithFormat:@"%02ld", (long)seconds];
        }   // 1:1:1
    } else {
        if (hours > 0) {
            hmsStr = [NSString stringWithFormat:@"%ld%@%ld%@%ld", (long)hours, separator, (long)minutes, separator, (long)seconds];
        } else if (minutes > 0) {
            hmsStr = [NSString stringWithFormat:@"%ld%@%ld", (long)minutes, separator, (long)seconds];
        } else {
            hmsStr = [NSString stringWithFormat:@"%ld", (long)seconds];
        }
    }
    return hmsStr;
}

+ (NSString *)timeStampWithDate:(NSDate *)date {
	NSTimeInterval a = [date timeIntervalSince1970] * 1000; // *1000 是精确到毫秒，不乘就是精确到秒
	NSString *timeString = [NSString stringWithFormat:@"%.0f", a]; //转为字符型
	return timeString;
}

+ (NSString *)timeStampWithNowDate {
	return [CZDateUtility timeStampWithDate:[NSDate dateWithTimeIntervalSinceNow:0]];
}

+ (NSDate *)dateFromTimeStamp:(NSString *)stamp {
    if (stamp.length == 0) {
        return nil;
    }
    NSTimeInterval interval = [stamp doubleValue] / 1000.0;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:interval];
    return date;
}

+ (NSString *)dateStringFromTimeStamp:(NSString *)stamp withDateFormat:(NSString *)dateFormat {
    if (stamp.length == 0) {
        return nil;
    }
	NSDate *date = [CZDateUtility dateFromTimeStamp:stamp];
	NSDateFormatter *dateformat = [[NSDateFormatter alloc] init];
	[dateformat setDateFormat:dateFormat];
	return [dateformat stringFromDate:date];
}

+ (NSDate *)dateFromDateString:(NSString *)dateString dateFormat:(NSString *)dateFormat {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = dateFormat;
    NSDate *date = [formatter dateFromString:dateString];
    return date;
}

+ (NSString *)dateStringFromDate:(NSDate *)date dateFormat:(NSString *)dateFormat {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = dateFormat;
    NSString *dateString = [formatter stringFromDate:date];
    return dateString;
}

@end
