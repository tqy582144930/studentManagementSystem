//
//  registerViewController.m
//  ios学生管理系统
//
//  Created by tuqiangyao on 2018/8/9.
//  Copyright © 2018年 tuqiangyao. All rights reserved.
//

#import "registerViewController.h"
#import "LoginViewController.h"

@interface registerViewController ()

@end

@implementation registerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:0.00f green:0.78f blue:0.76f alpha:1.00f];
    
    UIImage *loginImage = [UIImage imageNamed:@"注册"];
    UIImageView *loginImageView = [[UIImageView alloc] initWithImage:loginImage];
    loginImageView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    [self.view addSubview:loginImageView];
    
    _userImage = [UIImage imageNamed:@"user_img"];
    UIImageView *userView = [[UIImageView alloc] initWithImage:_userImage];
    userView.frame = CGRectMake(0, 0, 40, 40);
    
    _passImage = [UIImage imageNamed:@"pass_img"];
    UIImageView *passView = [[UIImageView alloc] initWithImage:_passImage];
    passView.frame = CGRectMake(0, 0, 40, 40);
    
    _UserTextField = [[UITextField alloc] init];
    _UserTextField.frame = CGRectMake(50, 320, 320, 50);
    _UserTextField.placeholder = @"请输入用户名";
    _UserTextField.alpha = 0.7;
    _UserTextField.borderStyle = UITextBorderStyleRoundedRect;
    
    _PassTextField = [[UITextField alloc] init];
    _PassTextField.frame = CGRectMake(50, 380, 320, 50);
    _PassTextField.placeholder = @"请输入密码......";
    _PassTextField.alpha = 0.7;
    _PassTextField.borderStyle = UITextBorderStyleRoundedRect;
    _PassTextField.secureTextEntry = YES;
    
    _UserTextField.leftView = userView;
    _UserTextField.leftViewMode = UITextFieldViewModeAlways;
    
    _PassTextField.leftView = passView;
    _PassTextField.leftViewMode = UITextFieldViewModeAlways;
    
    UIButton *registerButton = [UIButton  buttonWithType: UIButtonTypeRoundedRect];
    registerButton.frame = CGRectMake(140, 470, 140, 40);
    registerButton.backgroundColor = [UIColor whiteColor];
    registerButton.alpha = 0.5;
    [registerButton setTitle:@"确认注册" forState:UIControlStateNormal];
    registerButton.titleLabel.font = [UIFont systemFontOfSize:25];
    registerButton.tintColor = [UIColor blackColor];
    [registerButton.layer setCornerRadius:5];
    [registerButton.layer setBorderColor:[UIColor whiteColor].CGColor];
    [registerButton.layer setBorderWidth:2];
    [registerButton addTarget:self action:@selector(pressRegister) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_PassTextField];
    [self.view addSubview:_UserTextField];
    [self.view addSubview:registerButton];
    
}

- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [_UserTextField resignFirstResponder];
    [_PassTextField resignFirstResponder];
}

- (void)pressRegister {
    int i;
    for (i = 0; i < [_personMutableArray count]; i++) {
        if ([_personMutableArray[i][0] isEqualToString:_UserTextField.text]) {
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"该账户已存在" message:@"请重新输入" preferredStyle: UIAlertControllerStyleAlert];
            UIAlertAction *deleteAction = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDestructive handler:nil];
            [alertController addAction:deleteAction];
            
            [self presentViewController:alertController animated:YES completion:nil];
            break;
        }
    }
    if (i == [_personMutableArray count]) {
        [_delegate sendValue:_UserTextField.text andValue:_PassTextField.text];
        [self dismissViewControllerAnimated:YES completion:nil];
    }
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
