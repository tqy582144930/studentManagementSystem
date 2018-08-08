//
//  inquireViewController.m
//  ios学生管理系统
//
//  Created by tuqiangyao on 2018/8/7.
//  Copyright © 2018年 tuqiangyao. All rights reserved.
//

#import "inquireViewController.h"
#import "addViewController.h"
#import "deleteViewController.h"
#import "fixViewController.h"
#import "findViewController.h"
#import "Student.h"

@interface inquireViewController ()

@end

@implementation inquireViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.00f green:0.54f blue:0.80f alpha:1.00f];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont systemFontOfSize:22],
       NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    self.navigationItem.title = @"学生管理系统";
    self.tabBarController.tabBar.hidden = NO;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    addButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    addButton.backgroundColor = [UIColor whiteColor];
    addButton.frame = CGRectMake(60, 100, 300, 30);
    addButton.tintColor = [UIColor blackColor];
    [addButton setTitle:@"添加学生信息" forState:UIControlStateNormal];
    addButton.titleLabel.font = [UIFont systemFontOfSize:25];
    [addButton addTarget:self action:@selector(pressAdd) forControlEvents:UIControlEventTouchUpInside];
    
    deleteButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    deleteButton.backgroundColor = [UIColor whiteColor];
    deleteButton.frame = CGRectMake(60, 180, 300, 30);
    deleteButton.tintColor = [UIColor blackColor];
    [deleteButton setTitle:@"删除学生信息" forState:UIControlStateNormal];
    deleteButton.titleLabel.font = [UIFont systemFontOfSize:25];
    [deleteButton addTarget:self action:@selector(pressDelete) forControlEvents:UIControlEventTouchUpInside];
    
    fixButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    fixButton.backgroundColor = [UIColor whiteColor];
    fixButton.frame = CGRectMake(60, 260, 300, 30);
    fixButton.tintColor = [UIColor blackColor];
    [fixButton setTitle:@"修改学生信息" forState:UIControlStateNormal];
    fixButton.titleLabel.font = [UIFont systemFontOfSize:25];
    [fixButton addTarget:self action:@selector(pressFix) forControlEvents:UIControlEventTouchUpInside];
    
    findButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    findButton.backgroundColor = [UIColor whiteColor];
    findButton.frame = CGRectMake(60, 340, 300, 30);
    findButton.tintColor = [UIColor blackColor];
    [findButton setTitle:@"查询学生信息" forState:UIControlStateNormal];
    findButton.titleLabel.font = [UIFont systemFontOfSize:25];
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

- (void)pressAdd {
    addViewController *nextViewController = [[addViewController alloc] init];
    nextViewController.addStudentMutableArray = [NSMutableArray arrayWithArray:_studentMutableArray];
    [self.navigationController pushViewController:nextViewController animated:YES];
}

- (void)pressDelete {
    deleteViewController *nextViewController = [[deleteViewController alloc] init];
    nextViewController.deleteStudentMutableArray = [NSMutableArray arrayWithArray:_studentMutableArray];
    [self.navigationController pushViewController:nextViewController animated:YES];
}

- (void)pressFix {
    fixViewController *nextViewController = [[fixViewController alloc] init];
    nextViewController.fixStudentMutableArray = [NSMutableArray arrayWithArray:_studentMutableArray];
    [self.navigationController pushViewController:nextViewController animated:YES];
}

- (void)pressFind {
    findViewController *nextViewController = [[findViewController alloc] init];
    nextViewController.findStudentMutableArray = [NSMutableArray arrayWithArray:_studentMutableArray];
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
