//
//  VBPerson.h
//  AutoTestDemo
//
//  Created by 冯砚伟 on 2020/2/3.
//  Copyright © 2020 冯砚伟. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface VBPerson : NSObject
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *sex;
@property (nonatomic, strong) NSString *phoneNum;
@property (nonatomic, assign) NSInteger age;

-(NSString *)changeName:(NSString *)newName;
@end

NS_ASSUME_NONNULL_END
