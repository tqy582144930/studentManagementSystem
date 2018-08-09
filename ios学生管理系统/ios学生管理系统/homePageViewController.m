//
//  homePageViewController.m
//  ios学生管理系统
//
//  Created by tuqiangyao on 2018/8/9.
//  Copyright © 2018年 tuqiangyao. All rights reserved.
//

#import "homePageViewController.h"
#import "deleteViewController.h"
#import "addViewController.h"
#import "fixViewController.h"
#import "findViewController.h"

@interface homePageViewController ()

@end

@implementation homePageViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.00f green:0.78f blue:0.76f alpha:1.00f];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont systemFontOfSize:25],
       NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    self.navigationItem.title = @"学生管理系统";
    self.tabBarController.tabBar.hidden = NO;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:0.00f green:0.78f blue:0.76f alpha:1.00f];
    
    UIImage *loginImage = [UIImage imageNamed:@"首页"];
    UIImageView *loginImageView = [[UIImageView alloc] initWithImage:loginImage];
    loginImageView.frame = CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    [self.view addSubview:loginImageView];
    
    
    addButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    addButton.backgroundColor = [UIColor colorWithRed:0.99f green:0.99f blue:0.99f alpha:1.00f];
    addButton.frame = CGRectMake(60, 200, 120, 120);
    addButton.tintColor = [UIColor blackColor];
    addButton.alpha = 0.5;
    [addButton setTitle:@"添加" forState:UIControlStateNormal];
    addButton.titleLabel.font = [UIFont systemFontOfSize:20];
    [addButton setImage:[UIImage imageNamed:@"增加"] forState:UIControlStateNormal];
    [addButton addTarget:self action:@selector(pressAdd) forControlEvents:UIControlEventTouchUpInside];
    
    deleteButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    deleteButton.backgroundColor = [UIColor colorWithRed:0.99f green:0.99f blue:0.99f alpha:1.00f];
    deleteButton.frame = CGRectMake(240, 200, 120, 120);
    deleteButton.tintColor = [UIColor blackColor];
    deleteButton.alpha = 0.5;
    [deleteButton setTitle:@"删除" forState:UIControlStateNormal];
    deleteButton.titleLabel.font = [UIFont systemFontOfSize:20];
    [deleteButton setImage:[UIImage imageNamed:@"删除筛选项"] forState:UIControlStateNormal];
    [deleteButton addTarget:self action:@selector(pressDelete) forControlEvents:UIControlEventTouchUpInside];
    
    fixButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    fixButton.backgroundColor = [UIColor colorWithRed:0.99f green:0.99f blue:0.99f alpha:1.00f];
    fixButton.frame = CGRectMake(60, 380, 120, 120);
    fixButton.tintColor = [UIColor blackColor];
    fixButton.alpha = 0.5;
    [fixButton setTitle:@"修改" forState:UIControlStateNormal];
    fixButton.titleLabel.font = [UIFont systemFontOfSize:20];
    [fixButton setImage:[UIImage imageNamed:@"修 改"] forState:UIControlStateNormal];
    [fixButton addTarget:self action:@selector(pressFix) forControlEvents:UIControlEventTouchUpInside];
    
    findButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    findButton.backgroundColor = [UIColor colorWithRed:0.99f green:0.99f blue:0.99f alpha:1.00f];
    findButton.frame = CGRectMake(240, 380, 120, 120);
    findButton.tintColor = [UIColor blackColor];
    findButton.alpha = 0.5;
    [findButton setTitle:@"查询" forState:UIControlStateNormal];
    findButton.titleLabel.font = [UIFont systemFontOfSize:20];
    [findButton setImage:[UIImage imageNamed:@"查询"] forState:UIControlStateNormal];
    [findButton addTarget:self action:@selector(pressFind) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:addButton];
    [self.view addSubview:deleteButton];
    [self.view addSubview:fixButton];
    [self.view addSubview:findButton];
    
    _studentMutableArray = [[NSMutableArray alloc] init];
    _stu = [[Student alloc] initWithName:@"小黑" andClass:@"1701" andAge:@"23" andNum:@"43" andScore:@"54"];
    _stu1 = [[Student alloc] initWithName:@"小白" andClass:@"1702" andAge:@"34" andNum:@"23" andScore:@"154"];
    _stu2 = [[Student alloc] initWithName:@"小王" andClass:@"1703" andAge:@"25" andNum:@"65" andScore:@"23"];
    _stu3 = [[Student alloc] initWithName:@"小李" andClass:@"1704" andAge:@"21" andNum:@"76" andScore:@"67"];
    [_studentMutableArray addObject:_stu];
    [_studentMutableArray addObject:_stu1];
    [_studentMutableArray addObject:_stu2];
    [_studentMutableArray addObject:_stu3];
}

- (void)sendArray:(NSMutableArray *) addMutableArray {
    _studentMutableArray = [NSMutableArray arrayWithArray:addMutableArray];
}

- (void)pressAdd {
    addViewController *nextViewController = [[addViewController alloc] init];
    nextViewController.sendStudentMutableArray = [NSMutableArray arrayWithArray:_studentMutableArray];
    nextViewController.delegate = self;
    [self.navigationController pushViewController:nextViewController animated:YES];
}

- (void)sendDeleteArray:(NSMutableArray *) deleteMutableArray {
    _studentMutableArray = [NSMutableArray arrayWithArray:deleteMutableArray];
}

- (void)pressDelete {
    deleteViewController *nextViewController = [[deleteViewController alloc] init];
    nextViewController.sendStudentMutableArray = [NSMutableArray arrayWithArray:_studentMutableArray];
    nextViewController.delegate = self;
    [self.navigationController pushViewController:nextViewController animated:YES];
}

- (void)sendFixArray:(NSMutableArray *) fixMutableArray {
    _studentMutableArray = [NSMutableArray arrayWithArray:fixMutableArray];
}

- (void)pressFix {
    fixViewController *nextViewController = [[fixViewController alloc] init];
    nextViewController.sendStudentMutableArray = [NSMutableArray arrayWithArray:_studentMutableArray];
    nextViewController.delegate = self;
    [self.navigationController pushViewController:nextViewController animated:YES];
}

- (void)pressFind {
    findViewController *nextViewController = [[findViewController alloc] init];
    nextViewController.sendStudentMutableArray = [NSMutableArray arrayWithArray:_studentMutableArray];
    [self.navigationController pushViewController:nextViewController animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
