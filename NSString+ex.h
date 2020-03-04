//
//  NSString+ex.h
//
//  Created by calvien on 2018/11/5.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NSString (ex)
/**
 *  对字符串进行 urlencode
 *
 *  @return urlencode 后的字符串
 */
- (NSString *)urlencode;

/**
 *  对字符串进行 urldecode
 *
 *  @return urldecode 后的字符串
 */
- (NSString *)urldecode;

/**
 *  计算字符串的 MD5
 *
 *  @return MD5
 */
- (NSString *)md5;

/**
 *  去除字符串中的空格、回车等
 *
 *  @return NSString
 */
- (NSString *)trim;

/**
 *  计算文本Size
 *
 *  @param font f
 *  @param width w
 *
 *  @return NSString
 */
- (CGSize)sizeWithUIFont:(UIFont *)font forWidth:(CGFloat)width;

/**
 *  计算文本Size sizeWithUIFont实际上是调用了该方法
 *
 *  @param attribute a
 *  @param width w
 *
 *  @return NSString
 */
- (CGSize)sizeWithUIAttribute:(NSDictionary *)attribute forWidth:(CGFloat)width;

/**
 验证码手机号
 @return YES 通过 NO 不通过
 */
- (BOOL)validateContactNumber;
@end
