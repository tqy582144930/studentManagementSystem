//
//  fixViewController.m
//  ios学生管理系统
//
//  Created by tuqiangyao on 2018/8/7.
//  Copyright © 2018年 tuqiangyao. All rights reserved.
//

#import "fixViewController.h"
#import "addTableViewCell.h"
#import "Student.h"

@interface fixViewController ()

@end

@implementation fixViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    UIImage *loginImage = [UIImage imageNamed:@"修改背景"];
    UIImageView *loginImageView = [[UIImageView alloc] initWithImage:loginImage];
    loginImageView.frame = CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64);
    [self.view addSubview:loginImageView];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height/2) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.alpha = 0.7;
    _tableView.backgroundColor = [UIColor whiteColor];
    [_tableView registerClass:[addTableViewCell class] forCellReuseIdentifier:@"cell1"];
    [self.view addSubview:_tableView];
    
    UILabel *titleLable = [[UILabel alloc] init];
    titleLable.textColor = [UIColor blackColor];
    titleLable.font = [UIFont systemFontOfSize:23];
    titleLable.text = @"修改学生信息";
    titleLable.alpha = 0.5;
    titleLable.frame = CGRectMake(140, 370, 200, 30);
    [self.view addSubview:titleLable];
    
    UILabel *fixLable = [[UILabel alloc] init];
    fixLable.textColor = [UIColor blackColor];
    fixLable.font = [UIFont systemFontOfSize:20];
    fixLable.text = @"修改人序号:";
    fixLable.alpha = 0.7;
    fixLable.frame = CGRectMake(10, 410, 110, 35);
    [self.view addSubview:fixLable];
    
    UILabel *nameLable = [[UILabel alloc] init];
    nameLable.textColor = [UIColor blackColor];
    nameLable.font = [UIFont systemFontOfSize:20];
    nameLable.text = @"姓名:";
    nameLable.alpha = 0.7;
    nameLable.frame = CGRectMake(10, 455, 50, 35);
    [self.view addSubview:nameLable];
    
    UILabel *classLable = [[UILabel alloc] init];
    classLable.textColor = [UIColor blackColor];
    classLable.font = [UIFont systemFontOfSize:20];
    classLable.text = @"班级:";
    classLable.alpha = 0.7;
    classLable.frame = CGRectMake(10, 500, 50, 35);
    [self.view addSubview:classLable];
    
    UILabel *numLable = [[UILabel alloc] init];
    numLable.textColor = [UIColor blackColor];
    numLable.font = [UIFont systemFontOfSize:20];
    numLable.text = @"序号:";
    numLable.alpha = 0.7;
    numLable.frame = CGRectMake(10, 545, 50, 35);
    [self.view addSubview:numLable];
    
    UILabel *ageLable = [[UILabel alloc] init];
    ageLable.textColor = [UIColor blackColor];
    ageLable.font = [UIFont systemFontOfSize:20];
    ageLable.text = @"年龄:";
    ageLable.alpha = 0.7;
    ageLable.frame = CGRectMake(10, 590, 50, 35);
    [self.view addSubview:ageLable];
    
    UILabel *scoreLable = [[UILabel alloc] init];
    scoreLable.textColor = [UIColor blackColor];
    scoreLable.font = [UIFont systemFontOfSize:20];
    scoreLable.text = @"总成绩:";
    scoreLable.alpha = 0.7;
    scoreLable.frame = CGRectMake(10, 635, 70, 35);
    [self.view addSubview:scoreLable];
    
    UIButton *addButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    addButton.frame = CGRectMake(150, 690, 120, 40);
    addButton.backgroundColor = [UIColor whiteColor];
    addButton.tintColor = [UIColor blackColor];
    addButton.alpha = 0.5;
    [addButton.layer setCornerRadius:10];
    [addButton.layer setBorderColor:[UIColor whiteColor].CGColor];
    [addButton.layer setBorderWidth:2];
    [addButton setTitle:@"修改" forState:UIControlStateNormal];
    addButton.titleLabel.font = [UIFont systemFontOfSize:25];
    [addButton addTarget:self action:@selector(pressFix) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:addButton];
    
    _fixTextField = [[UITextField alloc] init];
    _fixTextField.frame = CGRectMake(125, 410, 270, 35);
    _fixTextField.placeholder = @"请输入修改学生序号";
    _fixTextField.alpha = 0.7;
    _fixTextField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:_fixTextField];
    
    _nameTextField = [[UITextField alloc] init];
    _nameTextField.frame = CGRectMake(65, 455, 330, 35);
    _nameTextField.placeholder = @"请输入姓名";
    _nameTextField.alpha = 0.7;
    _nameTextField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:_nameTextField];
    
    _classTextField = [[UITextField alloc] init];
    _classTextField.frame = CGRectMake(65, 500, 330, 35);
    _classTextField.placeholder = @"请输入班级";
    _classTextField.alpha = 0.7;
    _classTextField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:_classTextField];
    
    _numTextField = [[UITextField alloc] init];
    _numTextField.frame = CGRectMake(65, 545, 330, 35);
    _numTextField.placeholder = @"请输入序号";
    _numTextField.alpha = 0.7;
    _numTextField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:_numTextField];
    
    _ageTextField = [[UITextField alloc] init];
    _ageTextField.frame = CGRectMake(65, 590, 330, 35);
    _ageTextField.placeholder = @"请输入年龄";
    _ageTextField.alpha = 0.7;
    _ageTextField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:_ageTextField];
    
    _scoreTextField = [[UITextField alloc] init];
    _scoreTextField.frame = CGRectMake(80, 635, 315, 35);
    _scoreTextField.placeholder = @"请输入总分";
    _scoreTextField.alpha = 0.7;
    _scoreTextField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:_scoreTextField];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillAppear:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillDisappear:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)pressFix {
    int i;
    for (i = 0; i < [_sendStudentMutableArray count]; i++) {
        _fixStudentMutableArray = [_sendStudentMutableArray objectAtIndex:i];
        if ([_fixTextField.text isEqualToString:@""]) {
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"修改人序号不能为空" message:@"请重新输入" preferredStyle: UIAlertControllerStyleAlert];
            UIAlertAction *deleteAction = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDestructive handler:nil];
            [alertController addAction:deleteAction];
            [self presentViewController:alertController animated:YES completion:nil];
            break;
        }
        else if ([_fixStudentMutableArray.numString isEqualToString:_fixTextField.text]) {
            _fixStudentMutableArray.nameString = _nameTextField.text;
            _fixStudentMutableArray.classString = _classTextField.text;
            _fixStudentMutableArray.numString = _numTextField.text;
            _fixStudentMutableArray.ageString = _ageTextField.text;
            _fixStudentMutableArray.scoreString = _scoreTextField.text;
            if ([_nameTextField.text isEqualToString:@""] || [_classTextField.text isEqualToString:@""] || [_numTextField.text isEqualToString:@""] || [_ageTextField.text isEqualToString:@""] || [_scoreTextField.text isEqualToString:@""])  {
                UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"修改信息不能为空" message:@"请重新输入" preferredStyle: UIAlertControllerStyleAlert];
                UIAlertAction *deleteAction = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDestructive handler:nil];
                [alertController addAction:deleteAction];
                [self presentViewController:alertController animated:YES completion:nil];
                break;
            } else {
                [_delegate sendFixArray:_sendStudentMutableArray];
                [_tableView reloadData];
                
                _fixTextField.text = @"";
                _nameTextField.text = @"";
                _classTextField.text = @"";
                _numTextField.text = @"";
                _scoreTextField.text = @"";
                _ageTextField.text = @"";
                
                UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"学生信息修改成功" message:@"请在预览栏查看" preferredStyle: UIAlertControllerStyleAlert];
                UIAlertAction *deleteAction = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDestructive handler:nil];
                [alertController addAction:deleteAction];
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
        _fixTextField.text = @"";
    }
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

- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [_nameTextField resignFirstResponder];
    [_classTextField resignFirstResponder];
    [_numTextField resignFirstResponder];
    [_ageTextField resignFirstResponder];
    [_scoreTextField resignFirstResponder];
    [_fixTextField resignFirstResponder];
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
    cell.alpha = 0.7;
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
