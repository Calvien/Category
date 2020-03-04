//
//  DateUtil.h
//  AutoPartsManagement
//
//  Created by calvien on 2020/3/4.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DateUtil : NSObject
#pragma mark - 转化格式

/**
 *  根据NSDate转化成String (yyyy-MM-dd)
 *
 *  @params date 日期
 *  @return 字符串
 **/
+ (NSString *)getStringFromDate:(NSDate *)date;

/**
 *  根据NSString转化成NSDate (yyyy-MM-dd)
 *
 *  @params date 日期
 *  @return 字符串
 **/
+ (NSDate *)getDateFromString:(NSString *)string;

/**
 *  计算年龄
 *
 *  @parmas string 字符串
 *  @return 年龄int
 **/
+ (NSInteger)getAgeFromCompleteBirthday:(NSString *)string;

/**
 *  字符串转化成时间戳
 *
 *  @params string 字符串
 *  @return 时间戳
 **/
+ (NSString *)getTimeStampFromDateString:(NSString *)string;

/**
 *  date日期转化成时间戳
 *
 *  @params date 日期
 *  @return 时间戳
 **/
+ (NSString *)getTimeStampFromDate:(NSDate *)date;

/**
 *  分钟数转化成 多少天前，多少小时前
 *
 *  @params time 分钟数
 *  @return 返回多少天前，多少分钟前
 **/
+ (NSString *)getTimeFromTimeSpan:(NSString *)time;

/**
 *  时间戳转化成 多少天前，多少小时前
 *
 *  @params stamp 时间戳
 *  @return 返回多少天前，多少分钟前
 **/
+ (NSString *)getTimeFromTimeStamp:(NSString *)stamp;

/**
 *  时间戳传化成字符串
 *
 *  @params time 时间戳
 *  @params dateFormatter 时间格式
 *  @return 返回字符串
 **/
+ (NSString *)getDateDayFromTimeStamp:(NSString *)time dateFormatter:(NSString *)dateFormatter;

/**
 *  日期传化成字符串
 *
 *  @params date 日期
 *  @params dateFormatter 时间格式
 *  @return 返回字符串
 **/
+ (NSString *)getDateDayFromDate:(NSDate *)date dateFormatter:(NSString *)dateFormatter;

/**
 *  时间戳传化成日期对象
 *
 *  @params time 时间戳
 *  @params dateFormatter 时间格式
 *  @return 日期对象
 **/
+ (NSDate *)getDateFromTimeStamp:(NSString *)time dateFormatter:(NSString *)dateFormatter;

/**
 *  字符串传化成日期对象
 *
 *  @params string 字符串
 *  @params dateFormatter 时间格式
 *  @return 日期对象
 **/
+ (NSDate *)getDateFromDate:(NSString *)string dateFormatter:(NSString *)dateFormatter;

/**
 *  获取当前的时间戳
 **/
+ (NSString *)getCurrentTimeStamp;

/**
 *  获取当前的时间yyyy-MM-dd HH:mm:ss
 **/
+ (NSString *)getCurrentDate;

/**
 *  NSDate 计算星座
 *
 *  @params date 日期
 *  @return 返回星座月数
 **/
+ (NSString *)getAstroWithDate:(NSDate *)date;

/**
 *  根据时间戳 显示yyyy-MM-dd
 *
 *  @params time 时间戳
 *  @return 返回yyyy-MM-dd
 **/
+ (NSString *)getDateDayFromTimeStamp:(NSString *)time;

/**
 *  根据时间戳 显示yyyy-MM-dd  hh:mm
 *
 *  @params time 时间戳
 *  @return 返回yyyy-MM-dd hh:mm
 **/
+ (NSString *)getDateDayDetailFromTimeStamp:(NSString *)time;

/**
 *  根据时间戳 显示yyyy\MM\dd  hh:mm
 *
 *  @params time 时间戳
 *  @return 返回yyyy\MM\dd hh:mm
 **/
+ (NSString *)getDateDaySpecailDetailFromTimeStamp:(NSString *)time;

/**
 *  根据返回的时间戳字符串转化为yyyy/MM 格式字符串
 *
 *  @params time 时间戳
 *  @return 返回dd/MM
 **/
+ (NSString *)getYearAndMonthTimeStringFromDateString:(NSString *)dateString;

/**
 *  根据年月日日期获取当前星期几(2015-09-16)
 *
 *  @params time 时间戳
 *  @return 返回dd/MM
 **/
+ (NSString *)getweekDayStringByDateString:(NSString *)dateString;

/**
 *  获取当前时间的年\月\日返回数组
 *
 *  @params time 时间戳
 *  @return 返回dd/MM
 **/
+ (NSMutableArray *)getCurrentYearMonthDay;

/**
 *  获取\天\时\分
 *
 *  @params
 *  @return 返回\天\时\分
 **/
+ (NSString *)getTimeIntervalByStartTime:(NSString *)startTime andByEndTime:(NSString *)endTime;

/**
 *  获取NSTimeInterval时间间隔
 *
 *  @params
 *  @return NSTimeInterval类型
 **/
+ (NSTimeInterval)getDetailTypeTimeIntervalByStartTime:(NSString *)startTime andByEndTime:(NSString *)endTime;

/**
 *  时间字符串转换为UTC格式
 *
 *  @params
 *  @return NSTimeInterval类型
 **/
+(NSString*)getUTCFormateLocalDate:(NSString *)localDate;


/**
 *  获取今天之前year年的日期
 *
 *  @params year 年数
 *  @return Date类型
 **/
+ (NSDate *)beforeTodayOfYear:(NSInteger)year;

/**
 *  根据星期索引得到中文星期
 *
 *  @params index 索引
 *  @return 返回周几
 **/
+ (NSString *)getWeekDayStringOfIndex:(NSInteger)index;

/**
 *  判断两个时间是不是同一天
 *  @params date1 NSDate类型
 *  @params date2 NSDate类型
 *  @return 返回BOOL类型
 **/
+ (BOOL)isSameDay:(NSDate *)date1 date2:(NSDate *)date2;

+ (NSDateComponents*)numDaysFrom:(NSString *)from_time to_time:(NSString *)to_time
        timeStringFormat:(NSString *)format;

/**
 *  判断两个日期大小、前后
 *
 *  @return
 */
+(int)compareDate:(NSDate*)date1 withDate:(NSDate*)date2;


+ (NSString *)dateStringAfterlocalDateForYear:(NSInteger)year Month:(NSInteger)month Day:(NSInteger)day Hour:(NSInteger)hour Minute:(NSInteger)minute Second:(NSInteger)second;

+(NSString*)getHourMinWithDate:(NSDate*)date;

+ (NSString *)dateStringAfterDateForDay:(NSInteger)day;

+(NSString*)getHourWithDate:(NSDate*)date;
@end

NS_ASSUME_NONNULL_END
