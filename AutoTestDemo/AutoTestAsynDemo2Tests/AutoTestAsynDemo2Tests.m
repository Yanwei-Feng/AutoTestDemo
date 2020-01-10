//
//  AutoTestAsynDemo2Tests.m
//  AutoTestAsynDemo2Tests
//
//  Created by 冯砚伟 on 2020/1/6.
//  Copyright © 2020 冯砚伟. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NetManager.h"

@interface AutoTestAsynDemo2Tests : XCTestCase

@end

@implementation AutoTestAsynDemo2Tests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    
}

- (void)testExample {
    XCTWaiter *waiter = [[XCTWaiter alloc] initWithDelegate:self];
        
    XCTestExpectation *expect4 = [[XCTestExpectation alloc] initWithDescription:@"asyncTest4"];
    XCTestExpectation *expect5 = [[XCTestExpectation alloc] initWithDescription:@"asyncTest5"];
//    expect5.inverted = YES;
    
//    [TTFakeNetworkingInstance requestWithService:@"product.list" completionHandler:^(NSDictionary *response) {
//        XCTAssertTrue([response[@"code"] isEqualToString:@"200"]);
//        expect4 fulfill];
//    }];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [expect4 fulfill];
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [expect5 fulfill];
    });

//    XCTWaiterResult result = [waiter waitForExpectations:@[expect4] timeout:10 enforceOrder:NO];
    
    XCTWaiterResult result = [waiter waitForExpectations:@[expect4,expect5] timeout:10 enforceOrder:YES];
    XCTAssert(result == XCTWaiterResultCompleted, @"failure: %ld", result);
}

// 如果有期望超时，则调用。
- (void)waiter:(XCTWaiter *)waiter didTimeoutWithUnfulfilledExpectations:(NSArray<XCTestExpectation *> *)unfulfilledExpectations{
    
}

// 当履行的期望被强制要求按顺序履行，但期望以错误的顺序被履行，则调用。
- (void)waiter:(XCTWaiter *)waiter fulfillmentDidViolateOrderingConstraintsForExpectation:(XCTestExpectation *)expectation requiredExpectation:(XCTestExpectation *)requiredExpectation{
    
}

// 当某个期望被标记为被倒置，则调用。
- (void)waiter:(XCTWaiter *)waiter didFulfillInvertedExpectation:(XCTestExpectation *)expectation{
    
}

// 当 waiter 在 fullfill 和超时之前被打断，则调用。
- (void)nestedWaiter:(XCTWaiter *)waiter wasInterruptedByTimedOutWaiter:(XCTWaiter *)outerWaiter{
    
}
@end
