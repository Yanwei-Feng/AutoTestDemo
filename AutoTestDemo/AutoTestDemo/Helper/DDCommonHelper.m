//
//  DDCommonHelper.m
//  AutoTestDemo
//
//  Created by 冯砚伟 on 2020/1/2.
//  Copyright © 2020 冯砚伟. All rights reserved.
//

#import "DDCommonHelper.h"

@implementation DDCommonHelper
+(NSString *)getFormatedString:(NSInteger )seconds{
    NSInteger hour = seconds/3600;
    NSInteger minute = (seconds%3600)/60;
    NSInteger second = seconds%60;
    NSString *format_time;
    
    if (hour > 0){//时分秒格式
        format_time = [NSString stringWithFormat:@"%02ld时%02ld分%02ld秒",hour,minute,second];
//        format_time = [NSString stringWithFormat:@"%ld时%ld分%ld秒",hour,minute,second];
    }else {//分秒格式
        format_time = [NSString stringWithFormat:@"%02ld分%02ld秒",minute,second];
//        format_time = [NSString stringWithFormat:@"%ld分%ld秒",minute,second];
    }
    return format_time;

}
@end
