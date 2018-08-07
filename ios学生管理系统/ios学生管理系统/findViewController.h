//
//  findViewController.h
//  ios学生管理系统
//
//  Created by tuqiangyao on 2018/8/7.
//  Copyright © 2018年 tuqiangyao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface findViewController : UIViewController
<UITableViewDelegate,
UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UILabel *findNameLabel;
@property (nonatomic, strong) UILabel *findClassLabel;
@property (nonatomic, strong) UILabel *findNumLabel;
@property (nonatomic, strong) UILabel *findAgeLabel;
@property (nonatomic, strong) UILabel *findScoreLabel;
@property (nonatomic, strong) UITextField *findTextField;

@end
