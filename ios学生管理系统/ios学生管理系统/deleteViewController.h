//
//  deleteViewController.h
//  ios学生管理系统
//
//  Created by tuqiangyao on 2018/8/7.
//  Copyright © 2018年 tuqiangyao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "homePageViewController.h"

@protocol deleteViewControllerDelegate<NSObject>
- (void)sendDeleteArray:(NSMutableArray *) deleteMutableArray;
@end

@interface deleteViewController : UIViewController
<UITableViewDelegate,
UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UITextField *deleteTextField;
@property (nonatomic, strong) NSMutableArray *sendStudentMutableArray;
@property (nonatomic, strong) Student *deleteStudentMutableArray;
@property (nonatomic, weak) id <deleteViewControllerDelegate> delegate;
@end
