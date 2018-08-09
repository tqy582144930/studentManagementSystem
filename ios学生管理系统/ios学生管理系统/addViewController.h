//
//  addViewController.h
//  ios学生管理系统
//
//  Created by tuqiangyao on 2018/8/7.
//  Copyright © 2018年 tuqiangyao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "homePageViewController.h"

@protocol addViewControllerDelegate <NSObject>
- (void)sendArray:(NSMutableArray *) addMutableArray;
@end

@interface addViewController : UIViewController
<UITableViewDelegate,
UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UITextField *nameTextField;
@property (nonatomic, strong) UITextField *classTextField;
@property (nonatomic, strong) UITextField *numTextField;
@property (nonatomic, strong) UITextField *ageTextField;
@property (nonatomic, strong) UITextField *scoreTextField;
@property (nonatomic, strong) NSMutableArray *sendStudentMutableArray;
@property (nonatomic, strong) NSMutableArray *addMutableArray;
@property (nonatomic, strong) id <addViewControllerDelegate> delegate;
@end
