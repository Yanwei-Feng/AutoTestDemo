//
//  AutoTestAsynDemoTests.m
//  AutoTestAsynDemoTests
//
//  Created by 冯砚伟 on 2020/1/3.
//  Copyright © 2020 冯砚伟. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface AutoTestAsynDemoTests : XCTestCase

@end

@implementation AutoTestAsynDemoTests


- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    //1.新建期望
    // 测试类持有的初始化方法
    //XCTestExpectation *expect1 = [self expectationWithDescription:@"asyncTest1"];

    // 自己持有的初始化方法
//    XCTestExpectation *expect2 = [[XCTestExpectation alloc] initWithDescription:@"asyncTest3"];

    //2.等待期望被履行
    // 测试类持有时的等待方法
    //[self waitForExpectationsWithTimeout:10.0 handler:nil];

    // 自己持有时的等待方法
//    [self waitForExpectations:@[expect3] timeout:10.0];

    //3.履行期望
    XCTestExpectation *expect3 = [[XCTestExpectation alloc] initWithDescription:@"asyncTest3"];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        XCTAssert(NO);
        [expect3 fulfill];
    });
    [self waitForExpectations:@[expect3] timeout:10.0];
}
@end
