//
//  RegisterViewController.m
//  ios学生管理系统
//
//  Created by tuqiangyao on 2018/8/7.
//  Copyright © 2018年 tuqiangyao. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    _UserTextField = [[UITextField alloc] init];
    _UserTextField.frame = CGRectMake(50, 255, 320, 50);
    _UserTextField.placeholder = @"请输入用户名";
    _UserTextField.borderStyle = UITextBorderStyleRoundedRect;
    
    _PassTextField = [[UITextField alloc] init];
    _PassTextField.frame = CGRectMake(50, 320, 320, 50);
    _PassTextField.placeholder = @"请输入密码......";
    _PassTextField.borderStyle = UITextBorderStyleRoundedRect;
    _PassTextField.secureTextEntry = YES;
    
    UIButton *registerButton = [UIButton  buttonWithType: UIButtonTypeRoundedRect];
    registerButton.frame = CGRectMake(140, 430, 140, 40);
    [registerButton setTitle:@"确认注册" forState:UIControlStateNormal];
    registerButton.titleLabel.font = [UIFont systemFontOfSize:25];
    registerButton.tintColor = [UIColor blackColor];
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
    [self dismissViewControllerAnimated:YES completion:nil];
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
