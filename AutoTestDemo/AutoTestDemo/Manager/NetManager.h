//
//  NetManager.h
//  AutoTestDemo
//
//  Created by 冯砚伟 on 2020/1/9.
//  Copyright © 2020 冯砚伟. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking-umbrella.h>

NS_ASSUME_NONNULL_BEGIN
typedef  void(^SuccessBlock)(id response);
typedef  void(^FailureBlock)(NSError *error);

@interface NetManager : NSObject
+(instancetype)sharedInstance;
-(void)request;

-(void)getGoodsList:(NSString *)keyword success:(SuccessBlock)success failure:(FailureBlock) failure;
@end

NS_ASSUME_NONNULL_END
