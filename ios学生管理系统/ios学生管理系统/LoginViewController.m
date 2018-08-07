//
//  LoginViewController.m
//  ios学生管理系统
//
//  Created by tuqiangyao on 2018/8/7.
//  Copyright © 2018年 tuqiangyao. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "inquireViewController.h"
#import "addViewController.h"
#import "deleteViewController.h"
#import "fixViewController.h"
#import "findViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    _userTextField = [[UITextField alloc]init];
    _userTextField.frame = CGRectMake(50, 170, 320, 50);
    _userTextField.placeholder = @"请输入用户名";
    _userTextField.borderStyle = UITextBorderStyleRoundedRect;
    
    _passTextField = [[UITextField alloc] init];
    _passTextField.frame = CGRectMake(50, 230, 320, 50);
    _passTextField.placeholder = @"请输入密码......";
    _passTextField.borderStyle = UITextBorderStyleRoundedRect;
    _passTextField.secureTextEntry = YES;
    
    loginButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    loginButton.backgroundColor = [UIColor whiteColor];
    loginButton.frame = CGRectMake(90, 300, 110, 40);
    loginButton.tintColor = [UIColor blackColor];
    [loginButton setTitle:@"登陆" forState:UIControlStateNormal];
    loginButton.titleLabel.font = [UIFont systemFontOfSize:25];
    [loginButton addTarget:self action:@selector(pressLogin) forControlEvents:UIControlEventTouchUpInside];
    
    registerButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    registerButton.backgroundColor = [UIColor whiteColor];
    registerButton.frame = CGRectMake(230, 300, 110, 40);
    registerButton.tintColor = [UIColor blackColor];
    [registerButton setTitle:@"注册" forState:UIControlStateNormal];
    registerButton.titleLabel.font = [UIFont systemFontOfSize:25];
    [registerButton addTarget:self action:@selector(pressRegister) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:registerButton];
    [self.view addSubview:loginButton];
    [self.view addSubview:_userTextField];
    [self.view addSubview:_passTextField];
}

- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [_userTextField resignFirstResponder];
    [_passTextField resignFirstResponder];
}

- (void)pressLogin {
    inquireViewController *nextViewController = [[inquireViewController alloc] init];
    
    UINavigationController* navigationController= [[UINavigationController alloc] initWithRootViewController:nextViewController];

    [self presentViewController:navigationController animated:YES completion:nil];
}

- (void)pressRegister {
    RegisterViewController *nextViewController = [[RegisterViewController alloc] init];
    [self presentViewController:nextViewController animated:YES completion:nil];
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
