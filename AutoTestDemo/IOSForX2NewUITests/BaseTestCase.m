//
//  BaseTestCase.m
//  IOSForX2NewUITests
//
//  Created by 冯砚伟 on 2020/1/9.
//  Copyright © 2020 冯砚伟. All rights reserved.
//

#import "BaseTestCase.h"

@implementation BaseTestCase
- (void)setUp {
    self.continueAfterFailure = NO;
    
    self.myApp = [[XCUIApplication alloc] init];
    self.myApp.launchArguments = @[@"ResetDefaults", @"NoAnimations", @"UserHasRegistered"];
    [self.myApp launch];
    
    self.testApp = [[XCUIApplication alloc] initWithBundleIdentifier:@"com.jd.smart.dev"];
//    self.testApp.launchArguments = @[@"ResetDefaults", @"NoAnimations", @"UserHasRegistered"];
    [self.testApp launch];
    [self.testApp activate];
}

- (void)tearDown {
    
}

/// 登录方法
-(void)ensureLogin{
    //判断是否有广告页
    XCUIElement *jumpBtn = self.testApp.buttons[@"跳过"];
//    XCUICoordinate *coordinate = [jumpBtn coordinateWithNormalizedOffset:CGVectorMake(0, 0)];
//    [[coordinate coordinateWithOffset:CGVectorMake(0, 0)] tap];
    if (jumpBtn.exists){
        [jumpBtn tap];
    }
    //判断是否登录
    XCUIElement *loginPage = self.testApp.navigationBars[@"登录"];
    
    if (loginPage.exists){
        [self.testApp.buttons[@"其他快捷登录"] tap];
        [self.testApp.buttons[@"icon phone "] tap];
        
        XCUIElement *phoneField = self.testApp.textFields[@"手机号"];
        [phoneField tap];
        XCUIElement *cleanBtn = self.testApp.buttons[@"清除文本"];
        if (cleanBtn.exists){
            [cleanBtn tap];
        }
        [phoneField typeText:@"15620948172"];
        
        XCUIElement *pwdField = self.testApp.secureTextFields[@"密码"];
        [pwdField tap];
        [pwdField typeText:@"123456"];
        
        XCUIElement *loginBtn = self.testApp.buttons[@"登录"];
        [loginBtn tap];
    }else {
        //已经登录
    }
}


-(void)screenShotMyApp:(NSString *)name{
    [self screenShot:name application:self.myApp];
}

-(void)screenShotTestApp:(NSString *)name{
    [self screenShot:name application:self.testApp];
}

-(void)screenShot:(NSString *)name application:(XCUIApplication *)application{
    XCUIScreenshot *shot = [application screenshot];
    
    XCTAttachment *attach = [XCTAttachment attachmentWithScreenshot:shot];
    
    attach.lifetime = XCTAttachmentLifetimeKeepAlways;
    attach.name = name;
    
    [self addAttachment:attach];
}
@end
