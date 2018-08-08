//
//  Student.h
//  oc学生管理系统
//
//  Created by tuqiangyao on 2018/8/6.
//  Copyright © 2018年 tuqiangyao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject

@property (nonatomic, copy) NSString *nameString, *classString, *numString, *ageString, * scoreString;
- (id)initWithName:(NSString *)name andClass:(NSString *)class andAge:(NSString *)age andNum:(NSString *)num andScore:(NSString *)score;

@end







