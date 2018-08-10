//
//  findViewController.m
//  ios学生管理系统
//
//  Created by tuqiangyao on 2018/8/7.
//  Copyright © 2018年 tuqiangyao. All rights reserved.
//

#import "findViewController.h"
#import "addTableViewCell.h"
#import "Student.h"

@interface findViewController ()

@end

@implementation findViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:0.00f green:0.78f blue:0.76f alpha:1.00f];
    
    UIImage *loginImage = [UIImage imageNamed:@"查询背景"];
    UIImageView *loginImageView = [[UIImageView alloc] initWithImage:loginImage];
    loginImageView.frame = CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64);
    [self.view addSubview:loginImageView];
    
    UIButton *addButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    addButton.frame = CGRectMake(160, 420, 100, 40);
    addButton.backgroundColor = [UIColor whiteColor];
    addButton.tintColor = [UIColor blackColor];
    addButton.alpha = 0.5;
    [addButton.layer setCornerRadius:10];
    [addButton.layer setBorderColor:[UIColor whiteColor].CGColor];
    [addButton.layer setBorderWidth:2];
    [addButton setTitle:@"查询" forState:UIControlStateNormal];
    addButton.titleLabel.font = [UIFont systemFontOfSize:25];
    [addButton addTarget:self action:@selector(pressFind) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:addButton];
    
    UILabel *findLable = [[UILabel alloc] init];
    findLable.textColor = [UIColor blackColor];
    findLable.font = [UIFont systemFontOfSize:20];
    findLable.text = @"查询人序号:";
    findLable.alpha = 0.7;
    findLable.frame = CGRectMake(50, 110, 110, 30);
    [self.view addSubview:findLable];
    
    _findTextField = [[UITextField alloc] init];
    _findTextField.frame = CGRectMake(165, 110, 190, 30);
    _findTextField.placeholder = @"请输入查询学生序号";
    _findTextField.alpha = 0.7;
    _findTextField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:_findTextField];
    
}

- (void) pressFind {
    
    int i;
    for (i = 0; i < [_sendStudentMutableArray count]; i++) {
        _findMutableArray = [_sendStudentMutableArray objectAtIndex:i];
        if ([_findMutableArray.numString isEqualToString:_findTextField.text]) {
            
            UILabel *nameLable = [[UILabel alloc] init];
            nameLable.textColor = [UIColor blackColor];
            nameLable.font = [UIFont systemFontOfSize:20];
            nameLable.text = @"姓名:";
            nameLable.alpha = 0.7;
            nameLable.frame = CGRectMake(50, 150, 50, 30);
            [self.view addSubview:nameLable];
            
            UILabel *classLable = [[UILabel alloc] init];
            classLable.textColor = [UIColor blackColor];
            classLable.font = [UIFont systemFontOfSize:20];
            classLable.text = @"班级:";
            classLable.alpha = 0.7;
            classLable.frame = CGRectMake(50, 200, 50, 30);
            [self.view addSubview:classLable];
            
            UILabel *numLable = [[UILabel alloc] init];
            numLable.textColor = [UIColor blackColor];
            numLable.font = [UIFont systemFontOfSize:20];
            numLable.text = @"序号:";
            numLable.alpha = 0.7;
            numLable.frame = CGRectMake(50, 250, 50, 30);
            [self.view addSubview:numLable];
            
            UILabel *ageLable = [[UILabel alloc] init];
            ageLable.textColor = [UIColor blackColor];
            ageLable.font = [UIFont systemFontOfSize:20];
            ageLable.text = @"年龄:";
            ageLable.alpha = 0.7;
            ageLable.frame = CGRectMake(50, 300, 50, 30);
            [self.view addSubview:ageLable];
            
            UILabel *scoreLable = [[UILabel alloc] init];
            scoreLable.textColor = [UIColor blackColor];
            scoreLable.font = [UIFont systemFontOfSize:20];
            scoreLable.text = @"成绩:";
            scoreLable.alpha = 0.7;
            scoreLable.frame = CGRectMake(50, 350, 70, 30);
            [self.view addSubview:scoreLable];
            
            _findNameLabel = [[UILabel alloc] init];
            _findNameLabel.frame = CGRectMake(105, 150, 330, 30);
            _findNameLabel.alpha = 0.7;
            _findNameLabel.textColor = [UIColor blackColor];
            _findNameLabel.font = [UIFont systemFontOfSize:20];
            [self.view addSubview:_findNameLabel];
            
            _findClassLabel = [[UILabel alloc] init];
            _findClassLabel.frame = CGRectMake(105, 200, 330, 30);
            _findClassLabel.alpha = 0.7;
            _findClassLabel.textColor = [UIColor blackColor];
            _findClassLabel.font = [UIFont systemFontOfSize:20];
            [self.view addSubview:_findClassLabel];
            
            _findNumLabel = [[UILabel alloc] init];
            _findNumLabel.frame = CGRectMake(105, 250, 330, 30);
            _findNumLabel.alpha = 0.7;
            _findNumLabel.textColor = [UIColor blackColor];
            _findNumLabel.font = [UIFont systemFontOfSize:20];
            [self.view addSubview:_findNumLabel];
            
            _findAgeLabel = [[UILabel alloc] init];
            _findAgeLabel.frame = CGRectMake(105, 300, 330, 30);
            _findAgeLabel.textColor = [UIColor blackColor];
            _findAgeLabel.alpha = 0.7;
            _findAgeLabel.font = [UIFont systemFontOfSize:20];
            [self.view addSubview:_findAgeLabel];
            
            _findScoreLabel = [[UILabel alloc] init];
            _findScoreLabel.frame = CGRectMake(105, 350, 330, 30);
            _findScoreLabel.textColor = [UIColor blackColor];
            _findScoreLabel.alpha = 0.7;
            _findScoreLabel.font = [UIFont systemFontOfSize:20];
            [self.view addSubview:_findScoreLabel];
            
            _findNameLabel.text = _findMutableArray.nameString;
            _findClassLabel.text = _findMutableArray.classString;
            _findNumLabel.text = _findMutableArray.numString;
            _findAgeLabel.text = _findMutableArray.ageString;
            _findScoreLabel.text = _findMutableArray.scoreString;
//            
//            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"学生信息查询成功" message:@"" preferredStyle: UIAlertControllerStyleAlert];
//            UIAlertAction *deleteAction = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDestructive handler:nil];
//            [alertController addAction:deleteAction];
//            [self presentViewController:alertController animated:YES completion:nil];
            
            _findTextField.text = @"";
            break;
        }
    }
    if (i == [_sendStudentMutableArray count]) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"查无此人" message:@"请重新输入" preferredStyle: UIAlertControllerStyleAlert];
        UIAlertAction *deleteAction = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDestructive handler:nil];
        [alertController addAction:deleteAction];
        
        [self presentViewController:alertController animated:YES completion:nil];
        _findTextField.text = @"";
    }
}

- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [_findTextField resignFirstResponder];
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
