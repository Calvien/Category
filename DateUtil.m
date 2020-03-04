//
//  DateUtil.m
//  AutoPartsManagement
//
//  Created by calvien on 2020/3/4.
//

#import "DateUtil.h"

@implementation DateUtil
#pragma mark - 转化格式

/**
 *  根据NSDate转化成String (yyyy-MM-dd)
 *
 *  @params date 日期
 *  @return 字符串
 **/
+ (NSString *)getStringFromDate:(NSDate *)date {

    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *dateString = [formatter stringFromDate:date];
    return dateString;
    
}

/**
 *  根据NSString转化成NSDate (yyyy-MM-dd)
 *
 *  @params date 日期
 *  @return 字符串
 **/
+ (NSDate *)getDateFromString:(NSString *)string {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *date = [formatter dateFromString:string];
    return date;
}

/**
 *  计算年龄
 *
 *  @parmas string 字符串
 *  @return 年龄int
 **/
+ (NSInteger)getAgeFromCompleteBirthday:(NSString *)string {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *birDate = [formatter dateFromString:string];
    NSTimeInterval dateDiff = [birDate timeIntervalSinceNow];
    NSInteger age = -trunc(dateDiff/(60*60*24))/365;
    return age;
}

/**
 *  字符串转化成时间戳
 *
 *  @params string 字符串
 *  @return 时间戳
 **/
+ (NSString *)getTimeStampFromDateString:(NSString *)string {
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    
    NSDate *date = [formatter dateFromString:string];
    NSString *timeSp = [NSString stringWithFormat:@"%.0f",[date timeIntervalSince1970]*1000];
    
    return timeSp;
}

/**
 *  date日期转化成时间戳
 *
 *  @params date 日期
 *  @return 时间戳
 **/
+ (NSString *)getTimeStampFromDate:(NSDate *)date {
    NSString *timeSp = [NSString stringWithFormat:@"%.0f",[date timeIntervalSince1970]*1000];
    return timeSp;
}

/**
 *  分钟数转化成 多少天前，多少小时前
 *
 *  @params time 分钟数
 *  @return 返回多少天前，多少分钟前
 **/
+ (NSString *)getTimeFromTimeSpan:(NSString *)time {
    NSString *str = @"";
    int seconds = [time intValue];
    if (seconds <= 0) {
       str = @"刚刚";
    }else {
        if (seconds / (60*24) > 0 ) {
            str = [NSString stringWithFormat:@"%d天前",seconds / (60*24)];
        }else if (seconds / 60 > 0) {
            str = [NSString stringWithFormat:@"%d小时前",seconds / 60];
        }else {
            str = [NSString stringWithFormat:@"%ld分钟前",(long)seconds];
        }
    }
    return str;
}

/**
 *  时间戳转化成 多少天前，多少小时前
 *
 *  @params stamp 时间戳
 *  @return 返回多少天前，多少分钟前
 **/
+ (NSString *)getTimeFromTimeStamp:(NSString *)stamp {
    NSTimeInterval stamps = [stamp longLongValue]/1000;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:stamps];
    NSTimeInterval todayTime = [[NSDate date] timeIntervalSinceDate:date];
    
    return [self getTimeFromTimeSpan:[NSString stringWithFormat:@"%f",todayTime/60.0]];
}

/**
 *  时间戳传化成字符串
 *
 *  @params time 时间戳
 *  @params dateFormatter 时间格式
 *  @return 返回字符串
 **/
+ (NSString *)getDateDayFromTimeStamp:(NSString *)time dateFormatter:(NSString *)dateFormatter {
    NSTimeInterval stamp = [time longLongValue]/1000;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:stamp];
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:dateFormatter];
    NSString *dateStr = [formatter stringFromDate:date];
    return dateStr;
}

/**
 *  日期传化成字符串
 *
 *  @params time 日期
 *  @params dateFormatter 时间格式
 *  @return 返回字符串
 **/
+ (NSString *)getDateDayFromDate:(NSDate *)date dateFormatter:(NSString *)dateFormatter {
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:dateFormatter];
    NSString *dateStr = [formatter stringFromDate:date];
    return dateStr;
}


/**
 *  时间戳传化成日期对象
 *
 *  @params time 时间戳
 *  @params dateFormatter 时间格式
 *  @return 日期对象
 **/
+ (NSDate *)getDateFromTimeStamp:(NSString *)time dateFormatter:(NSString *)dateFormatter {
    NSTimeInterval stamp = [time doubleValue]/1000;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:stamp];
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:dateFormatter];
    NSString *dateStr = [formatter stringFromDate:date];
    NSDate *tDate = [formatter dateFromString:dateStr];
    return tDate;
}

/**
 *  字符串传化成日期对象
 *
 *  @params string 字符串
 *  @params dateFormatter 时间格式
 *  @return 日期对象
 **/
+ (NSDate *)getDateFromDate:(NSString *)string dateFormatter:(NSString *)dateFormatter {
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:dateFormatter];
    NSDate *tDate = [formatter dateFromString:string];
    return tDate;
}

/**
 *  时间字符串转换为UTC格式
 *
 *  @params
 *  @return NSTimeInterval类型
 **/
+(NSString*)getUTCFormateLocalDate:(NSString *)localDate{

    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //输入格式
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSS"];
    
    NSDate *dateFormatted = [dateFormatter dateFromString:localDate];
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"UTC"];
    [dateFormatter setTimeZone:timeZone];
    //输出格式
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"];
    NSString *dateString = [dateFormatter stringFromDate:dateFormatted];
    
    return dateString;


}


/**
 *  获取当前的时间戳
 **/
+ (NSString *)getCurrentTimeStamp {
    NSDate *date = [NSDate date];
    NSTimeInterval time = [date timeIntervalSince1970];
    return [NSString stringWithFormat:@"%.0f",time*1000];
}

/**
 *  获取当前的时间yyyy-MM-dd HH:mm:ss
 **/
+ (NSString *)getCurrentDate {
    NSDate *date = [NSDate date];
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSString *dateStr = [formatter stringFromDate:date];
    return dateStr;
}
+ (NSString *)dateStringAfterlocalDateForYear:(NSInteger)year Month:(NSInteger)month Day:(NSInteger)day Hour:(NSInteger)hour Minute:(NSInteger)minute Second:(NSInteger)second
{
    // 当前日期
    NSDate *localDate = [NSDate date];
    // 在当前日期时间加上 时间：格里高利历
    NSCalendar *gregorian = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *offsetComponent = [[NSDateComponents alloc]init];
    
    [offsetComponent setYear:year ];  // 设置开始时间为当前时间的前x年
    [offsetComponent setMonth:month];
    [offsetComponent setDay:day];
    [offsetComponent setHour:hour]; // 中国时区为正八区，未处理为本地，所以+8
    [offsetComponent setMinute:minute];
    [offsetComponent setSecond:second];
    // 当前时间后若干时间
    NSDate *minDate = [gregorian dateByAddingComponents:offsetComponent toDate:localDate options:0];

    return   [self getHourWithDate:minDate];
}
+(NSString*)getHourWithDate:(NSDate*)date{
    
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:NSCalendarUnitHour fromDate:date];
     NSString *strHour = [NSString stringWithFormat:@"%ld", [components hour]];
    return strHour;
}

+(NSString *)getHourMinWithDate:(NSDate *)date{

    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:NSCalendarUnitMinute fromDate:date];
    NSString *strMin = [NSString stringWithFormat:@"%ld", [components minute]];
    return strMin;


}
+ (NSString *)dateStringAfterDateForDay:(NSInteger)day
{
    // 当前日期
    NSDate *localDate = [NSDate date];
    // 在当前日期时间加上 时间：格里高利历
    NSCalendar *gregorian = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *offsetComponent = [[NSDateComponents alloc]init];
    
//    [offsetComponent setYear:year ];  // 设置开始时间为当前时间的前x年
//    [offsetComponent setMonth:month];
    [offsetComponent setDay:day];
//    [offsetComponent setHour:hour]; // 中国时区为正八区，未处理为本地，所以+8
//    [offsetComponent setSecond:second];
    // 当前时间后若干时间
    NSDate *minDate = [gregorian dateByAddingComponents:offsetComponent toDate:localDate options:0];
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *dateStr = [formatter stringFromDate:minDate];
    return  dateStr;
}

/**
 *  NSDate 计算星座
 *
 *  @params date 日期
 *  @return 返回星座月数
 **/
+ (NSString *)getAstroWithDate:(NSDate *)date {
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"MM"];
    NSString *mStr = [formatter stringFromDate:date];
    [formatter setDateFormat:@"dd"];
    NSString *dStr = [formatter stringFromDate:date];
    
    int m = [mStr intValue];
    int d = [dStr intValue];
    NSString *astroFormat = @"101122344432";
    
    NSString *str1 = [astroFormat substringWithRange:NSMakeRange(m-1, 1)];
    NSString *str2 = [NSString stringWithFormat:@"2%@",str1];
    int xzIndex = 1;
    if (m > 3) {
        if (d >= [str2 intValue]) {
            xzIndex = m-2;
        }else {
            xzIndex = m-3;
        }
    }else if (m==3) {
        if (d >= [str2 intValue]) {
            xzIndex = m-2;
        }else {
            xzIndex = 12;
        }
    }else {
        if (d >= [str2 intValue]) {
            xzIndex = (m+12)-2;
        }else {
            xzIndex = (m+12)-3;
        }
    }
    return [NSString stringWithFormat:@"%d",xzIndex];
}

/**
 *  根据时间戳 显示yyyy-MM-dd
 *
 *  @params time 时间戳
 *  @return 返回yyyy-MM-dd
 **/
+ (NSString *)getDateDayFromTimeStamp:(NSString *)time {
    NSTimeInterval stamp = [time longLongValue]/1000;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:stamp];
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *dateStr = [formatter stringFromDate:date];
    return dateStr;
}

/**
 *  根据时间戳 显示yyyy-MM-dd  hh:mm
 *
 *  @params time 时间戳
 *  @return 返回yyyy-MM-dd hh:mm
 **/
+ (NSString *)getDateDayDetailFromTimeStamp:(NSString *)time {
    NSTimeInterval stamp = [time longLongValue]/1000;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:stamp];
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSString *dateStr = [formatter stringFromDate:date];
    return dateStr;
}

/**
 *  根据时间戳 显示yyyy\MM\dd  hh:mm
 *
 *  @params time 时间戳
 *  @return 返回yyyy\MM\dd hh:mm
 **/
+ (NSString *)getDateDaySpecailDetailFromTimeStamp:(NSString *)time {
    NSTimeInterval stamp = [time longLongValue]/1000;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:stamp];
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy/MM/dd hh:mm"];
    NSString *dateStr = [formatter stringFromDate:date];
    return dateStr;
}

/**
 *  根据返回的时间戳字符串转化为yyyy/MM 格式字符串
 *
 *  @params time 时间戳
 *  @return 返回yyyy/MM
 **/
+ (NSString *)getYearAndMonthTimeStringFromDateString:(NSString *)dateString {
    NSTimeInterval stamp = [dateString longLongValue]/1000;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:stamp];
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy/MM"];
    NSString *dateStr = [formatter stringFromDate:date];
    return dateStr;
}

/**
 *  根据年月日日期获取当前星期几(2015-09-16)
 *
 *  @params time 时间戳
 *  @return 返回dd/MM
 **/
+ (NSString *)getweekDayStringByDateString:(NSString *)dateString {
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    
        NSDate *date = [formatter dateFromString:dateString];
//    NSDate *date = [NSDate date];
    NSString *resultString = [self getWeekDay:date];
    return resultString;
}

/**
 *  获取当前时间的年\月\日返回数组
 *
 *  @params time 时间戳
 *  @return 返回dd/MM
 **/
+ (NSMutableArray *)getCurrentYearMonthDay {
    NSString *dateString = [self getStringFromDate:[NSDate date]];
    NSArray *dateArray = [dateString componentsSeparatedByString:@"-"];
    NSMutableArray *resultArray = [[NSMutableArray alloc] init];
    
    NSString *year = [NSString stringWithFormat:@"%@年",[dateArray objectAtIndex:0]];
    [resultArray addObject:year];
    
    // 几月几日星期几
    NSString *month = [NSString stringWithFormat:@"%@月",[dateArray objectAtIndex:1]];
    NSString *day = [NSString stringWithFormat:@"%@日",[dateArray objectAtIndex:2]];
    NSString *week = [self getWeekDay:[NSDate date]];
    NSString *monthDayWeekStr = [[month stringByAppendingString:day] stringByAppendingString:week];
    [resultArray addObject:monthDayWeekStr];
    
    return resultArray;
}

#pragma mark - 内部方法
+ (NSString *)getWeekDay:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    unsigned unitFlag = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSCalendarUnitWeekday;
    NSDateComponents *comp = [calendar components:unitFlag fromDate:date];
    NSInteger week = comp.weekday;
    switch (week) {
        case 1:
            return @"周日";
            break;
        case 2:
            return @"周一";
            break;
        case 3:
            return @"周二";
            break;
        case 4:
            return @"周三";
            break;
        case 5:
            return @"周四";
            break;
        case 6:
            return @"周五";
            break;
        case 7:
            return @"周六";
            break;
        default:
            break;
    }
    return @"";
}

/**
 *  获取\天\时\分
 *
 *  @params
 *  @return 返回\天\时\分
 **/
+ (NSString *)getTimeIntervalByStartTime:(NSString *)startTime andByEndTime:(NSString *)endTime {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        
    NSTimeInterval startStamp = [startTime longLongValue]/1000;
    NSDate *startDate = [NSDate dateWithTimeIntervalSince1970:startStamp];
    NSString *startDateStr = [formatter stringFromDate:startDate];
    NSDate *start = [formatter dateFromString:startDateStr];
    
    NSTimeInterval endStamp = [endTime longLongValue]/1000;
    NSDate *endDate = [NSDate dateWithTimeIntervalSince1970:endStamp];
    NSString *endDateStr = [formatter stringFromDate:endDate];
    NSDate *end = [formatter dateFromString:endDateStr];
    
    // 取两个日期对象的时间间隔
    NSTimeInterval time=[start timeIntervalSinceDate:end];
    
    int days = ((int)time)/(3600*24);
    int hours = ((int)time)%(3600*24)/3600;
    
    int hour = (int)(time/3600);
    int minutes = (int)(time - hour*3600)/60;

    NSString *dateContent = [[NSString alloc] initWithFormat:@"%i天%i小时%i分",days,hours,minutes];
    
    if (days < 0 || hours < 0 || minutes < 0) {
        return @"";
    }else {
        return dateContent;
    }
}

/**
 *  获取NSTimeInterval时间间隔
 *
 *  @params
 *  @return NSTimeInterval类型
 **/
+ (NSTimeInterval)getDetailTypeTimeIntervalByStartTime:(NSString *)startTime andByEndTime:(NSString *)endTime {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSTimeInterval startStamp = [startTime longLongValue]/1000;
    NSDate *startDate = [NSDate dateWithTimeIntervalSince1970:startStamp];
    NSString *startDateStr = [formatter stringFromDate:startDate];
    NSDate *start = [formatter dateFromString:startDateStr];
    
    NSTimeInterval endStamp = [endTime longLongValue]/1000;
    NSDate *endDate = [NSDate dateWithTimeIntervalSince1970:endStamp];
    NSString *endDateStr = [formatter stringFromDate:endDate];
    NSDate *end = [formatter dateFromString:endDateStr];
    
    // 取两个日期对象的时间间隔
    NSTimeInterval time = [start timeIntervalSinceDate:end];
    return time;

//    if (days < 0 || hours < 0 || minutes < 0) {
//        return @"";
//    }else {
//        return time;
//    }
}

/**
 *  获取今天之前year年的日期
 *
 *  @params year 年数
 *  @return Date类型
 **/
+ (NSDate *)beforeTodayOfYear:(NSInteger)year {
    NSDate *today = [NSDate date];
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    NSDateComponents *comps = nil;
    
    comps = [calendar components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit fromDate:today];
    
    NSDateComponents *adcomps = [[NSDateComponents alloc] init];
    
    [adcomps setYear:-year];
    
    [adcomps setMonth:0];
    
    [adcomps setDay:0];
    
    NSDate *newdate = [calendar dateByAddingComponents:adcomps toDate:today options:0];
    
    return newdate;
}

/**
 *  根据星期索引得到中文星期
 *
 *  @params index 索引
 *  @return 返回周几
 **/
+ (NSString *)getWeekDayStringOfIndex:(NSInteger)index {
    NSString *week = @"周日";
    switch (index) {
        case 0:
            week = @"周日";
            break;
        case 1:
            week = @"周一";
            break;
        case 2:
            week = @"周二";
            break;
        case 3:
            week = @"周三";
            break;
        case 4:
            week = @"周四";
            break;
        case 5:
            week = @"周五";
            break;
        case 6:
            week = @"周六";
            break;
            
        default:
            break;
    }
    return week;
}

/**
 *  判断两个时间是不是同一天
 *  @params date1 NSDate类型
 *  @params date2 NSDate类型
 *  @return 返回BOOL类型
 **/
+ (BOOL)isSameDay:(NSDate *)date1 date2:(NSDate *)date2 {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    unsigned unitFlag = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit;
    NSDateComponents *comp1 = [calendar components:unitFlag fromDate:date1];
    NSDateComponents *comp2 = [calendar components:unitFlag fromDate:date2];
    return (([comp1 day] == [comp2 day]) && ([comp1 month] == [comp2 month]) && ([comp1 year] == [comp2 year]));
}

+ (NSDateComponents*)numDaysFrom:(NSString *)from_time to_time:(NSString *)to_time
        timeStringFormat:(NSString *)format
{
    if ( !format ) {
        format = @"yyyy-MM-dd HH:mm";
    }
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setTimeZone:[NSTimeZone systemTimeZone]];
    [formatter setDateFormat:NSLocalizedString(format,nil)];
    
    NSDate *dateFromString = [formatter dateFromString:from_time];
    NSDate *dateToString = [formatter dateFromString:to_time];

    NSTimeInterval time=[dateToString timeIntervalSinceDate:dateFromString];
    
    int days=((int)time)/(3600*24);
    int hours=((int)time)%(3600*24)/3600;
    int minute=((int)time)%(3600*24)%3600/60;
    
    NSDateComponents *c = [NSDateComponents new];
    c.day = days;
    c.hour = hours;
    c.minute = minute;
    return c;
}
/**
 *  判断两个日期的大小
 *

 */


+(int)compareDate:(NSDate *)date1 withDate:(NSDate *)date2{
    int ci;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSString *oneDayStr = [dateFormatter stringFromDate:date1];
    NSString *anotherDayStr = [dateFormatter stringFromDate:date2];
    NSDate *dateA = [dateFormatter dateFromString:oneDayStr];
    NSDate *dateB = [dateFormatter dateFromString:anotherDayStr];
    NSComparisonResult result = [dateA compare:dateB];
    switch (result)
    {
            //date2比date1大
        case NSOrderedAscending: ci=1;
            break;
            //date2比date1小
        case NSOrderedDescending: ci=-1;
            break;
            //date2=date1
        case NSOrderedSame: ci=0;
            break;
        default: NSLog(@"erorr dates %@, %@", dateA, dateB);
            break;
    }
    return ci;


}
@end
