//
//  addViewController.m
//  ios学生管理系统
//
//  Created by tuqiangyao on 2018/8/7.
//  Copyright © 2018年 tuqiangyao. All rights reserved.
//

#import "addViewController.h"
#import "addTableViewCell.h"
#import "Student.h"

@interface addViewController ()

@end

@implementation addViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImage *loginImage = [UIImage imageNamed:@"添加背景"];
    UIImageView *loginImageView = [[UIImageView alloc] initWithImage:loginImage];
    loginImageView.frame = CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64);
    [self.view addSubview:loginImageView];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height/2) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = [UIColor whiteColor];
    _tableView.alpha = 0.5;
    [_tableView registerClass:[addTableViewCell class] forCellReuseIdentifier:@"cell1"];
    [self.view addSubview:_tableView];
    
    UILabel *titleLable = [[UILabel alloc] init];
    titleLable.textColor = [UIColor blackColor];
    titleLable.font = [UIFont systemFontOfSize:23];
    titleLable.text = @"添加学生信息";
    titleLable.alpha = 0.5;
    titleLable.frame = CGRectMake(140, 370, 200, 30);
    [self.view addSubview:titleLable];
    
    UILabel *nameLable = [[UILabel alloc] init];
    nameLable.textColor = [UIColor blackColor];
    nameLable.font = [UIFont systemFontOfSize:20];
    nameLable.text = @"姓名:";
    nameLable.alpha = 0.5;
    nameLable.frame = CGRectMake(10, 410, 50, 30);
    [self.view addSubview:nameLable];
    
    UILabel *classLable = [[UILabel alloc] init];
    classLable.textColor = [UIColor blackColor];
    classLable.font = [UIFont systemFontOfSize:20];
    classLable.text = @"班级:";
    classLable.alpha = 0.5;
    classLable.frame = CGRectMake(10, 460, 50, 30);
    [self.view addSubview:classLable];
    
    UILabel *numLable = [[UILabel alloc] init];
    numLable.textColor = [UIColor blackColor];
    numLable.font = [UIFont systemFontOfSize:20];
    numLable.text = @"序号:";
    numLable.alpha = 0.5;
    numLable.frame = CGRectMake(10, 510, 50, 30);
    [self.view addSubview:numLable];
    
    UILabel *ageLable = [[UILabel alloc] init];
    ageLable.textColor = [UIColor blackColor];
    ageLable.font = [UIFont systemFontOfSize:20];
    ageLable.text = @"年龄:";
    ageLable.alpha = 0.5;
    ageLable.frame = CGRectMake(10, 560, 50, 30);
    [self.view addSubview:ageLable];
    
    UILabel *scoreLable = [[UILabel alloc] init];
    scoreLable.textColor = [UIColor blackColor];
    scoreLable.font = [UIFont systemFontOfSize:20];
    scoreLable.text = @"总成绩:";
    scoreLable.alpha = 0.5;
    scoreLable.frame = CGRectMake(10, 610, 70, 30);
    [self.view addSubview:scoreLable];
    
    UIButton *addButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    addButton.frame = CGRectMake(150, 660, 120, 40);
    addButton.backgroundColor = [UIColor whiteColor];
    addButton.tintColor = [UIColor blackColor];
    addButton.alpha = 0.5;
    [addButton.layer setCornerRadius:10];
    [addButton.layer setBorderColor:[UIColor whiteColor].CGColor];
    [addButton.layer setBorderWidth:2];
    [addButton setTitle:@"添加" forState:UIControlStateNormal];
    addButton.titleLabel.font = [UIFont systemFontOfSize:25];
    [addButton addTarget:self action:@selector(pressAdd) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:addButton];
    
    _nameTextField = [[UITextField alloc] init];
    _nameTextField.frame = CGRectMake(65, 410, 330, 35);
    _nameTextField.placeholder = @"请输入姓名";
    _nameTextField.alpha = 0.5;
    _nameTextField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:_nameTextField];
    
    _classTextField = [[UITextField alloc] init];
    _classTextField.frame = CGRectMake(65, 460, 330, 35);
    _classTextField.placeholder = @"请输入班级";
    _classTextField.alpha = 0.5;
    _classTextField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:_classTextField];
    
    _numTextField = [[UITextField alloc] init];
    _numTextField.frame = CGRectMake(65, 510, 330, 35);
    _numTextField.placeholder = @"请输入序号";
    _numTextField.alpha = 0.5;
    _numTextField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:_numTextField];
    
    _ageTextField = [[UITextField alloc] init];
    _ageTextField.frame = CGRectMake(65, 560, 330, 35);
    _ageTextField.placeholder = @"请输入年龄";
    _ageTextField.alpha = 0.5;
    _ageTextField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:_ageTextField];
    
    _scoreTextField = [[UITextField alloc] init];
    _scoreTextField.frame = CGRectMake(80, 610, 315, 35);
    _scoreTextField.placeholder = @"请输入总分";
    _scoreTextField.alpha = 0.5;
    _scoreTextField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:_scoreTextField];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillAppear:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillDisappear:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)pressAdd {
    _addMutableArray = [[NSMutableArray alloc] init];
    Student *addStudent = [[Student alloc] init];
    addStudent.nameString = _nameTextField.text;
    addStudent.classString = _classTextField.text;
    addStudent.numString = _numTextField.text;
    addStudent.ageString = _ageTextField.text;
    addStudent.scoreString = _scoreTextField.text;
    int flag = 1;
    for (int i = 0; i < [_sendStudentMutableArray count]; i++) {
        Student *stu = [_sendStudentMutableArray objectAtIndex:i];
        if ([stu.numString isEqualToString:_numTextField.text]) {
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"此学生已存在" message:@"请重新输入" preferredStyle: UIAlertControllerStyleAlert];
            UIAlertAction *deleteAction = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDestructive handler:nil];
            [alertController addAction:deleteAction];
            [self presentViewController:alertController animated:YES completion:nil];
            flag = 0;
            break;
        }
    }
    if ([_nameTextField.text isEqualToString:@""] || [_classTextField.text isEqualToString:@""] || [_numTextField.text isEqualToString:@""] || [_ageTextField.text isEqualToString:@""] || [_scoreTextField.text isEqualToString:@""]) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"输入数据不能为空" message:@"请重新输入" preferredStyle: UIAlertControllerStyleAlert];
        UIAlertAction *deleteAction = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDestructive handler:nil];
        [alertController addAction:deleteAction];
        
        [self presentViewController:alertController animated:YES completion:nil];
    }else {
        if (flag) {
            NSScanner *numScanner = [NSScanner scannerWithString:_numTextField.text];
            NSScanner *ageScanner = [NSScanner scannerWithString:_ageTextField.text];
            NSScanner *scoreScanner = [NSScanner scannerWithString:_scoreTextField.text];
            int val;
            if ((_numTextField.text.length > 3 && ![numScanner scanInt:&val] && ![numScanner isAtEnd]) || (_ageTextField.text.length > 3 && ![ageScanner scanInt:&val] && ![ageScanner isAtEnd]) || (_scoreTextField.text.length > 3 && ![scoreScanner scanInt:&val] && ![scoreScanner isAtEnd]) ) {
                UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"请输入3位以下数字" message:@"" preferredStyle: UIAlertControllerStyleAlert];
                UIAlertAction *deleteAction = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDestructive handler:nil];
                [alertController addAction:deleteAction];
                [self presentViewController:alertController animated:YES completion:nil];
            }
            else {
                [_sendStudentMutableArray addObject:addStudent];
                [_delegate sendArray:_sendStudentMutableArray];
                
                [_addMutableArray addObject:addStudent];
                [_tableView reloadData];
                
                _nameTextField.text = @"";
                _classTextField.text = @"";
                _numTextField.text = @"";
                _scoreTextField.text = @"";
                _ageTextField.text = @"";
                
                UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"添加成功" message:@"请在预览栏查看" preferredStyle: UIAlertControllerStyleAlert];
                UIAlertAction *deleteAction = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDestructive handler:nil];
                [alertController addAction:deleteAction];
                
                [self presentViewController:alertController animated:YES completion:nil];
            }
            
        }
        
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
    //cell.backgroundColor = [UIColor whiteColor];
    //cell.alpha = 0.5;
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
