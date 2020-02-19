//
//  IOSForX2NewUITests.m
//  IOSForX2NewUITests
//
//  Created by 冯砚伟 on 2020/1/9.
//  Copyright © 2020 冯砚伟. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "BaseTestCase.h"

@interface IOSForX2NewUITests : BaseTestCase

@end

@implementation IOSForX2NewUITests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testAddAlarm{
    [self ensureLogin];
    
    [self.testApp.buttons[@"叮咚"] tap];
    [[self.testApp.cells elementBoundByIndex:2] tap];
    //判断是否进入“闹钟提醒页面”
    XCUIElement *alarmPage = self.testApp.navigationBars[@"闹钟提醒"];
    if (!alarmPage.exists){
        XCTFail(@"");
    }
    //设置一个预期 判断 数据加载成cd功， 等待直至失败，如果符合则不再等待
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"count >= %d",1];
    [self expectationForPredicate:predicate evaluatedWithObject:self.testApp.cells handler:nil];
    [self waitForExpectationsWithTimeout:15 handler:nil];
    
    //0.记录原始个数
    NSInteger count = self.testApp.cells.count;
    
    //1.添加闹钟
    XCUIElement *addAlarm = self.testApp.buttons[@"添加闹钟"];
    if (!addAlarm.exists){
        addAlarm =self.testApp.navigationBars[@"闹钟提醒"].buttons[@"添加提醒"];
    }
    
    [addAlarm tap];
    
    //2.修改数据
    XCUIElementQuery *datePIckersQuery = self.testApp.datePickers;
    [datePIckersQuery.pickerWheels.firstMatch swipeUp];
    [datePIckersQuery.pickerWheels.allElementsBoundByIndex[1] swipeUp];
    [datePIckersQuery.pickerWheels.allElementsBoundByIndex[2] swipeUp];
    
    [self.testApp.buttons[@"保存"] tap];
    
    //判断是否添加成功
    //设置一个预期 判断 app.cells 的 count 属性会等于 cellsCount+1， 等待直至失败，如果符合则不再等待
    NSPredicate *predicate2 = [NSPredicate predicateWithFormat:@"count == %d",count+1];
    [self expectationForPredicate:predicate2 evaluatedWithObject:self.testApp.cells handler:nil];
    [self waitForExpectationsWithTimeout:15 handler:nil];
    [self screenShotTestApp:@"alarm"];
}


-(void)testUIRecording{

}

@end
