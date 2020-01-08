//
//  DDCommonHelper.h
//  AutoTestDemo
//
//  Created by 冯砚伟 on 2020/1/2.
//  Copyright © 2020 冯砚伟. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DDCommonHelper : NSObject

/// 通过秒数获取（01时%03分%02秒、03分%02秒）格式化的字符串
/// @param seconds 秒
+(NSString *)getFormatedString:(NSInteger )seconds;
@end

NS_ASSUME_NONNULL_END
