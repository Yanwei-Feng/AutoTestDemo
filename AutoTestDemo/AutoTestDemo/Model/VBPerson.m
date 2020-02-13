//
//  VBPerson.m
//  AutoTestDemo
//
//  Created by 冯砚伟 on 2020/2/3.
//  Copyright © 2020 冯砚伟. All rights reserved.
//

#import "VBPerson.h"

@implementation VBPerson

-(NSString *)description{
    return [NSString stringWithFormat:@"%@今年%ld岁了",self.name, (long)self.age];
}
-(NSString *)changeName:(NSString *)newName{
    NSString *oldName = _name;
    _name = newName;
    return oldName;
}
@end
