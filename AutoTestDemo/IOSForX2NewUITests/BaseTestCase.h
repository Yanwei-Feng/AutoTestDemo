//
//  BaseTestCase.h
//  IOSForX2NewUITests
//
//  Created by 冯砚伟 on 2020/1/9.
//  Copyright © 2020 冯砚伟. All rights reserved.
//

#import <XCTest/XCTest.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseTestCase : XCTestCase
@property (nonatomic, strong) XCUIApplication *myApp;
@property (nonatomic, strong) XCUIApplication *testApp;

-(void)ensureLogin;
@end

NS_ASSUME_NONNULL_END
