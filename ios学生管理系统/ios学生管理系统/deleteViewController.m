//
//  deleteViewController.m
//  ios学生管理系统
//
//  Created by tuqiangyao on 2018/8/7.
//  Copyright © 2018年 tuqiangyao. All rights reserved.
//

#import "deleteViewController.h"
#import "addTableViewCell.h"
#import "Student.h"

@interface deleteViewController ()

@end

@implementation deleteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    UIImage *loginImage = [UIImage imageNamed:@"删除背景"];
    UIImageView *loginImageView = [[UIImageView alloc] initWithImage:loginImage];
    loginImageView.frame = CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64);
    [self.view addSubview:loginImageView];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width,([UIScreen mainScreen].bounds.size.height/4)*3) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = [UIColor whiteColor];
    _tableView.alpha = 0.7;
    [_tableView registerClass:[addTableViewCell class] forCellReuseIdentifier:@"cell1"];
    [self.view addSubview:_tableView];
    
    UILabel *titleLable = [[UILabel alloc] init];
    titleLable.textColor = [UIColor blackColor];
    titleLable.font = [UIFont systemFontOfSize:23];
    titleLable.text = @"删除学生信息";
    titleLable.alpha = 0.5;
    titleLable.frame = CGRectMake(140, 570, 200, 30);
    [self.view addSubview:titleLable];
    
    UILabel *deleteLable = [[UILabel alloc] init];
    deleteLable.textColor = [UIColor blackColor];
    deleteLable.font = [UIFont systemFontOfSize:20];
    deleteLable.text = @"删除人序号:";
    deleteLable.alpha = 0.7;
    deleteLable.frame = CGRectMake(10, 620, 110, 30);
    [self.view addSubview:deleteLable];
    
    _deleteTextField = [[UITextField alloc] init];
    _deleteTextField.frame = CGRectMake(125, 620, 270, 30);
    _deleteTextField.placeholder = @"请输入删除学生序号";
    _deleteTextField.alpha = 0.7;
    _deleteTextField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:_deleteTextField];
    
    UIButton *addButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    addButton.frame = CGRectMake(150, 670, 120, 40);
    addButton.backgroundColor = [UIColor whiteColor];
    addButton.tintColor = [UIColor blackColor];
    [addButton.layer setCornerRadius:10];
    [addButton.layer setBorderColor:[UIColor whiteColor].CGColor];
    [addButton.layer setBorderWidth:2];
    addButton.alpha = 0.5;
    [addButton setTitle:@"删除" forState:UIControlStateNormal];
    addButton.titleLabel.font = [UIFont systemFontOfSize:25];
    [addButton addTarget:self action:@selector(pressDelete) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:addButton];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillAppear:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillDisappear:) name:UIKeyboardWillHideNotification object:nil];
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

- (void)pressDelete {
    int i;
   
    for (i = 0 ; i < [_sendStudentMutableArray count]; i++) {
        _deleteStudentMutableArray = [_sendStudentMutableArray objectAtIndex:i];
      if ([_deleteTextField.text isEqualToString:@""]) {
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"输入数据不能为空" message:@"请重新输入" preferredStyle: UIAlertControllerStyleAlert];
            UIAlertAction *deleteAction = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDestructive handler:nil];
            [alertController addAction:deleteAction];
            [self presentViewController:alertController animated:YES completion:nil];
          break;
      }
      else {
          if ([_deleteStudentMutableArray.numString isEqualToString:_deleteTextField.text]) {
              [_sendStudentMutableArray removeObjectAtIndex:i];
              [_tableView reloadData];
              UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"学生信息删除成功" message:@"请在预览栏查看" preferredStyle: UIAlertControllerStyleAlert];
              UIAlertAction *deleteAction = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDestructive handler:nil];
              [alertController addAction:deleteAction];
              _deleteTextField.text = @"";
              [_delegate sendDeleteArray:_sendStudentMutableArray];
              
              [self presentViewController:alertController animated:YES completion:nil];
              break;
          }
      }
    }
    if (i == [_sendStudentMutableArray count]) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"查无此人" message:@"请重新输入" preferredStyle: UIAlertControllerStyleAlert];
        UIAlertAction *deleteAction = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDestructive handler:nil];
        [alertController addAction:deleteAction];

        [self presentViewController:alertController animated:YES completion:nil];
        _deleteTextField.text = @"";
    }
}

- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_deleteTextField resignFirstResponder];
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return [_sendStudentMutableArray count];
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    addTableViewCell *cell = nil;
    if (cell == nil) {
        cell = [_tableView dequeueReusableCellWithIdentifier:@"cell1" forIndexPath:indexPath];
    }
    Student *stu = _sendStudentMutableArray[indexPath.section];
    cell.addNameLable.text = stu.nameString;
    cell.addClassLable.text = stu.classString;
    cell.addNumLable.text = stu.numString;
    cell.addAgeLable.text = stu.ageString;
    cell.addScoreLable.text = stu.scoreString;
    //cell.backgroundColor = [UIColor colorWithRed:0.00f green:0.78f blue:0.76f alpha:1.00f];
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
