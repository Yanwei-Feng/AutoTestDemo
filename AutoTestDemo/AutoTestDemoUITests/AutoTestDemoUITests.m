//
//  AutoTestDemoUITests.m
//  AutoTestDemoUITests
//
//  Created by 冯砚伟 on 2019/12/31.
//  Copyright © 2019 冯砚伟. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface AutoTestDemoUITests : XCTestCase
@property (nonatomic, strong) XCUIApplication *application;
@end

@implementation AutoTestDemoUITests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.

    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    self.application = [[XCUIApplication alloc] init];
    [self.application launch];
    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    self.application = nil;
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

//- (void)testExample {
//    // UI tests must launch the application that they test.
////    XCUIApplication *app = [[XCUIApplication alloc] init];
////    [app launch];
//
//    // Use recording to get started writing UI tests.
//    // Use XCTAssert and related functions to verify your tests produce the correct results.
//}
//
//- (void)testLaunchPerformance {
//    if (@available(macOS 10.15, iOS 13.0, tvOS 13.0, *)) {
//        // This measures how long it takes to launch your application.
////        [self measureWithMetrics:@[XCTOSSignpostMetric.applicationLaunchMetric] block:^{
////            [[[XCUIApplication alloc] init] launch];
////        }];
//    }
//}

-(void)testLoginAction{
    XCUIElement *nameTextField = self.application.textFields[@"请输入用户名"];
    [nameTextField tap];
    [nameTextField typeText:@"15620948172"];
    
    XCUIElement *pwdTextField = self.application.textFields[@"请输入密码"];
    [pwdTextField tap];
    [pwdTextField typeText:@"123456"];
    
    [self.application.buttons[@"登录"] tap];
    
    XCUIElement *indexCtrl = self.application.navigationBars[@"首页"];
    //判断是否登录成功
    XCTAssertNotNil(indexCtrl,@"");
}

-(void)testLogout{
    [[[XCUIApplication alloc] init].buttons[@"登录"] tap];
}


@end
