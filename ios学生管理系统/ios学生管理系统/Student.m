//
//  Student.m
//  oc学生管理系统
//
//  Created by tuqiangyao on 2018/8/6.
//  Copyright © 2018年 tuqiangyao. All rights reserved.
//

#import "Student.h"

@implementation Student

- (id)initWithName:(NSString *)name andClass:(NSString *)class andAge:(NSString *)age andNum:(NSString *)num andScore:(NSString *)score {
    self = [super init];
    if (self) {
        _nameString = name;
        _numString = num;
        _ageString = age;
        _scoreString = score;
        _classString = class;
    }
    return self;
}


@end
