//
//  AutoTestDemoTests.m
//  AutoTestDemoTests
//
//  Created by 冯砚伟 on 2019/12/31.
//  Copyright © 2019 冯砚伟. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DDCommonHelper.h"
#import "DDSolution.h"

@interface AutoTestDemoTests : XCTestCase

@end

@implementation AutoTestDemoTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    //1.准备输入
    NSInteger time1 = 56;
    //2.运行正在测试的代码
    NSString *time1_formated = [DDCommonHelper getFormatedString:time];
    //3.验证输出
    XCTAssert([time1_formated isEqualToString:@"00分56秒"],@"格式化输入时间工具类错误:%@",time1_formated);
    
    NSString *time2_formated = [DDCommonHelper getFormatedString:185];
    XCTAssert([time2_formated isEqualToString:@"03分05秒"],@"格式化输入时间工具类错误:%@",time2_formated);
    
    NSString *time3_formated = [DDCommonHelper getFormatedString:3695];
    XCTAssert([time3_formated isEqualToString:@"01时01分35秒"],@"格式化输入时间工具类错误:%@",time3_formated);
}


#pragma mark - 性能测试
-(void)testPerformanceExample{
    [self measureBlock:^{
        [self myFunction];
    }];
}


-(void)myFunction{
    for (int i=0; i< 100; i++){
        NSString *tempString;
        char tempChar[1000];
        
        strcpy(tempChar,dpLongestPalindrome((char *)[@"ujmrfcujmrfcujmedikmesxujfchnesdxuhrfchnedchsxikmszol,sxjrdcyhnfvjmfvik,mgbol,edcjnedcyhnwesdxjmwsxhnqatgbqaszyhbedxuhjneducjmdcikmrfvcikfvok,tgvboltgbkmedcjmwesduxjmwsxnwsxhbdcgbedchnedfchnerfcjnmedhczxcvbcxcvbxfvrfvdcedtgyhukolujyrfedwsxqawsdcefvyhnjmik,ik,nwesdxjmwsxhnqatgbqaszyhbedxuhjneducjmdcikmrfvcikfvok,tgvboltgbkmedcjmwesduxjmwsxnwsxhbdcgbedchnedfchnerfcjnmedhczxcvbcxcvbxfvrfvdcedtgyhukolujyrfedwsxqawsdcefvyhnjmik,ik,qwertyuioppoiuytrewq" UTF8String]));
        tempString = [NSString stringWithFormat:@"%s",tempChar];
        NSLog(@"%@",tempString);
    }
}


-(void)testPerformanceExample2{
//    [self measureMetrics:[self class].defaultPerformanceMetrics automaticallyStartMeasuring:NO forBlock:^{
//        [self setupSomething];
//
//        [self startMeasuring];
//        // Do that thing you want to measure.
//        [self myFunction];
//
//        [self stopMeasuring];
//
//        // Do teardown work that needs to be done for every iteration but you don't want to measure after the call to -stopMeasuring
//        [self teardownSomething];
//    }];
    
    [self measureMetrics:[self class].defaultPerformanceMetrics automaticallyStartMeasuring:NO forBlock:^{
        [self setupSomething];
        // Do that thing you want to measure.
        [self myFunction];
        // Do teardown work that needs to be done for every iteration but you don't want to measure after the call to -stopMeasuring
        [self teardownSomething];
    }];
}

-(void)setupSomething{
    sleep(1);
}

-(void)teardownSomething{
    sleep(1);
}

@end
