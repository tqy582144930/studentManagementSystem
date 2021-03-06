//
//  fixViewController.h
//  ios学生管理系统
//
//  Created by tuqiangyao on 2018/8/7.
//  Copyright © 2018年 tuqiangyao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "homePageViewController.h"

@protocol fixViewControllerDelegate<NSObject>
- (void)sendFixArray:(NSMutableArray *) fixMutableArray;
@end

@interface fixViewController : UIViewController
<UITableViewDelegate,
UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UITextField *nameTextField;
@property (nonatomic, strong) UITextField *classTextField;
@property (nonatomic, strong) UITextField *numTextField;
@property (nonatomic, strong) UITextField *ageTextField;
@property (nonatomic, strong) UITextField *scoreTextField;
@property (nonatomic, strong) UITextField *fixTextField;
@property (nonatomic, strong) NSMutableArray *sendStudentMutableArray;
@property (nonatomic, strong) Student *fixStudentMutableArray;
@property (nonatomic,weak) id <fixViewControllerDelegate> delegate;
@end
