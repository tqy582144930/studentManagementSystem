//
//  LoginViewController.m
//  ios学生管理系统
//
//  Created by tuqiangyao on 2018/8/7.
//  Copyright © 2018年 tuqiangyao. All rights reserved.
//

#import "LoginViewController.h"
#import "registerViewController.h"
#import "homePageViewController.h"
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
    self.view.backgroundColor = [UIColor colorWithRed:0.00f green:0.78f blue:0.76f alpha:1.00f];
    
    UIImage *loginImage = [UIImage imageNamed:@"登陆.jpg"];
    UIImageView *loginImageView = [[UIImageView alloc] initWithImage:loginImage];
    loginImageView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    [self.view addSubview:loginImageView];
    
    _LoginMutableArray = [NSMutableArray arrayWithObjects:@[@"123456",@"123456"], @[@"06172009", @"123456"], nil];
    _array = [[NSMutableArray alloc] init];
    
    _userImage = [UIImage imageNamed:@"user_img"];
    UIImageView *userView = [[UIImageView alloc] initWithImage:_userImage];
    userView.frame = CGRectMake(0, 0, 40, 40);
    
    _passImage = [UIImage imageNamed:@"pass_img"];
    UIImageView *passView = [[UIImageView alloc] initWithImage:_passImage];
    passView.frame = CGRectMake(0, 0, 40, 40);
    
    _userTextField = [[UITextField alloc]init];
    _userTextField.frame = CGRectMake(50, 310, 320, 50);
    _userTextField.placeholder = @"请输入用户名";
    _userTextField.alpha = 0.5;
    _userTextField.borderStyle = UITextBorderStyleRoundedRect;
    
    _passTextField = [[UITextField alloc] init];
    _passTextField.frame = CGRectMake(50, 370, 320, 50);
    _passTextField.placeholder = @"请输入密码......";
    _passTextField.alpha = 0.5;
    _passTextField.borderStyle = UITextBorderStyleRoundedRect;
    _passTextField.secureTextEntry = YES;
    
    _userTextField.leftView = userView;
    _userTextField.leftViewMode = UITextFieldViewModeAlways;
    
    _passTextField.leftView = passView;
    _passTextField.leftViewMode = UITextFieldViewModeAlways;
    
    loginButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    loginButton.backgroundColor = [UIColor whiteColor];
    loginButton.frame = CGRectMake(90, 450, 110, 40);
    loginButton.tintColor = [UIColor blackColor];
    loginButton.alpha = 0.5;
    [loginButton.layer setCornerRadius:10];
    [loginButton.layer setBorderColor:[UIColor whiteColor].CGColor];
    [loginButton.layer setBorderWidth:2];
    [loginButton setTitle:@"登陆" forState:UIControlStateNormal];
    loginButton.titleLabel.font = [UIFont systemFontOfSize:25];
    [loginButton addTarget:self action:@selector(pressLogin) forControlEvents:UIControlEventTouchUpInside];
    
    registerButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    registerButton.backgroundColor = [UIColor whiteColor];
    registerButton.frame = CGRectMake(230, 450, 110, 40);
    registerButton.tintColor = [UIColor blackColor];
    registerButton.alpha = 0.5;
    [registerButton.layer setCornerRadius:10];
    [registerButton.layer setBorderColor:[UIColor whiteColor].CGColor];
    [registerButton.layer setBorderWidth:2];
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

- (void)sendValue:(NSString *)UserString andValue:(NSString *)passString {
    _userTextField.text = UserString;
    _passTextField.text = passString;
    [_array addObject:UserString];
    [_array addObject:passString];
    [_LoginMutableArray addObject:_array];
    _array = [[NSMutableArray alloc] init];
    _LoginMutableArray = [NSMutableArray arrayWithArray:_LoginMutableArray];
}

- (void)pressLogin {
    int i;
    for (i = 0; i < [_LoginMutableArray count]; i++) {
        if ([_LoginMutableArray[i][0] isEqualToString:_userTextField.text] && [_LoginMutableArray[i][1] isEqualToString:_passTextField.text]) {
            homePageViewController *nextViewController = [[homePageViewController alloc] init];
            UINavigationController* navigationController= [[UINavigationController alloc] initWithRootViewController:nextViewController];
            [self presentViewController:navigationController animated:YES completion:nil];
            break;
        }
    }
    if (i == [_LoginMutableArray count]) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"账户或密码不正确" message:@"请重新输入" preferredStyle: UIAlertControllerStyleAlert];
        UIAlertAction *deleteAction = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDestructive handler:nil];
        [alertController addAction:deleteAction];
        
        [self presentViewController:alertController animated:YES completion:nil];
    }
}

- (void)pressRegister {
    registerViewController *nextViewController = [[registerViewController alloc] init];
    nextViewController.delegate = self;
    nextViewController.personMutableArray = [NSMutableArray arrayWithArray:_LoginMutableArray];
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
