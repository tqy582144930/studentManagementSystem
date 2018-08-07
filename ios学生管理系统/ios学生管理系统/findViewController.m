//
//  findViewController.m
//  ios学生管理系统
//
//  Created by tuqiangyao on 2018/8/7.
//  Copyright © 2018年 tuqiangyao. All rights reserved.
//

#import "findViewController.h"
#import "addTableViewCell.h"

@interface findViewController ()

@end

@implementation findViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height/2) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[addTableViewCell class] forCellReuseIdentifier:@"cell1"];
    [self.view addSubview:_tableView];
    
    UILabel *titleLable = [[UILabel alloc] init];
    titleLable.textColor = [UIColor blackColor];
    titleLable.font = [UIFont systemFontOfSize:23];
    titleLable.text = @"学生信息查询如下";
    titleLable.frame = CGRectMake(130, 370, 200, 30);
    [self.view addSubview:titleLable];
    
    UILabel *findLable = [[UILabel alloc] init];
    findLable.textColor = [UIColor blackColor];
    findLable.font = [UIFont systemFontOfSize:20];
    findLable.text = @"查询人序号:";
    findLable.frame = CGRectMake(10, 410, 110, 30);
    [self.view addSubview:findLable];
    
    UILabel *nameLable = [[UILabel alloc] init];
    nameLable.textColor = [UIColor blackColor];
    nameLable.font = [UIFont systemFontOfSize:20];
    nameLable.text = @"姓名:";
    nameLable.frame = CGRectMake(10, 455, 50, 30);
    [self.view addSubview:nameLable];
    
    UILabel *classLable = [[UILabel alloc] init];
    classLable.textColor = [UIColor blackColor];
    classLable.font = [UIFont systemFontOfSize:20];
    classLable.text = @"班级:";
    classLable.frame = CGRectMake(10, 500, 50, 30);
    [self.view addSubview:classLable];
    
    UILabel *numLable = [[UILabel alloc] init];
    numLable.textColor = [UIColor blackColor];
    numLable.font = [UIFont systemFontOfSize:20];
    numLable.text = @"序号:";
    numLable.frame = CGRectMake(10, 545, 50, 30);
    [self.view addSubview:numLable];
    
    UILabel *ageLable = [[UILabel alloc] init];
    ageLable.textColor = [UIColor blackColor];
    ageLable.font = [UIFont systemFontOfSize:20];
    ageLable.text = @"年龄:";
    ageLable.frame = CGRectMake(10, 590, 50, 30);
    [self.view addSubview:ageLable];
    
    UILabel *scoreLable = [[UILabel alloc] init];
    scoreLable.textColor = [UIColor blackColor];
    scoreLable.font = [UIFont systemFontOfSize:20];
    scoreLable.text = @"总成绩:";
    scoreLable.frame = CGRectMake(10, 635, 70, 30);
    [self.view addSubview:scoreLable];
    
    UIButton *addButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    addButton.frame = CGRectMake(150, 670, 120, 40);
    addButton.backgroundColor = [UIColor colorWithRed:0.00f green:0.53f blue:0.80f alpha:1.00f];
    addButton.tintColor = [UIColor whiteColor];
    [addButton.layer setCornerRadius:10];
    [addButton.layer setBorderColor:[UIColor whiteColor].CGColor];
    [addButton.layer setBorderWidth:2];
    [addButton setTitle:@"查询" forState:UIControlStateNormal];
    addButton.titleLabel.font = [UIFont systemFontOfSize:25];
    [addButton addTarget:self action:@selector(pressFind) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:addButton];
    
    _findTextField = [[UITextField alloc] init];
    _findTextField.frame = CGRectMake(125, 410, 270, 35);
    _findTextField.placeholder = @"请输入查询学生序号";
    _findTextField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:_findTextField];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillAppear:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillDisappear:) name:UIKeyboardWillHideNotification object:nil];
}

- (void) pressFind {
    _findNameLabel = [[UILabel alloc] init];
    _findNameLabel.frame = CGRectMake(65, 455, 330, 30);
    _findNameLabel.text = @"1";
    _findNameLabel.textColor = [UIColor blackColor];
    _findNameLabel.font = [UIFont systemFontOfSize:20];
    [self.view addSubview:_findNameLabel];
    
    _findClassLabel = [[UILabel alloc] init];
    _findClassLabel.frame = CGRectMake(65, 500, 330, 30);
    _findClassLabel.text = @"1";
    _findClassLabel.textColor = [UIColor blackColor];
    _findClassLabel.font = [UIFont systemFontOfSize:20];
    [self.view addSubview:_findClassLabel];
    
    _findNumLabel = [[UILabel alloc] init];
    _findNumLabel.frame = CGRectMake(65, 545, 330, 30);
    _findNumLabel.text = @"1";
    _findNumLabel.textColor = [UIColor blackColor];
    _findNumLabel.font = [UIFont systemFontOfSize:20];
    [self.view addSubview:_findNumLabel];
    
    _findAgeLabel = [[UILabel alloc] init];
    _findAgeLabel.frame = CGRectMake(65, 590, 330, 30);
    _findAgeLabel.text = @"1";
    _findAgeLabel.textColor = [UIColor blackColor];
    _findAgeLabel.font = [UIFont systemFontOfSize:20];
    [self.view addSubview:_findAgeLabel];
    
    _findScoreLabel = [[UILabel alloc] init];
    _findScoreLabel.frame = CGRectMake(80, 635, 330, 30);
    _findScoreLabel.text = @"1";
    _findScoreLabel.textColor = [UIColor blackColor];
    _findScoreLabel.font = [UIFont systemFontOfSize:20];
    [self.view addSubview:_findScoreLabel];
    
}

- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [_findTextField resignFirstResponder];
}

- (void)keyboardWillDisappear:(NSNotification *)notification{
    [UIView animateWithDuration:1 animations:^{
        self.view.transform = CGAffineTransformMakeTranslation(0, 0);
    }];
}

- (void)keyboardWillAppear:(NSNotification *)notification{
    // 计算键盘高度
    CGRect keyboardFrame = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat keyboardY = keyboardFrame.origin.y;
    // 视图整体上升
    [UIView animateWithDuration:1.0 animations:^{self.view.transform = CGAffineTransformMakeTranslation(0, keyboardY - self.view.frame.size.height);}];
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 10;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    addTableViewCell *cell = nil;
    if (cell == nil) {
        cell = [_tableView dequeueReusableCellWithIdentifier:@"cell1" forIndexPath:indexPath];
    }
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}
//获取尾部高度
- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0;
}

- (UIView*) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return nil;
}
- (UIView*) tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
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
