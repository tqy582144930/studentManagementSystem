//
//  inquireViewController.h
//  ios学生管理系统
//
//  Created by tuqiangyao on 2018/8/7.
//  Copyright © 2018年 tuqiangyao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Student.h"

@interface inquireViewController : UIViewController
{
    UIButton *addButton;
    UIButton *deleteButton;
    UIButton *fixButton;
    UIButton *findButton;
}
@property (nonatomic, strong) NSMutableArray *studentMutableArray;
@property (nonatomic, strong) Student *stu;
@property (nonatomic, strong) Student *stu1;
@property (nonatomic, strong) Student *stu2;
@property (nonatomic, strong) Student *stu3;
@end
