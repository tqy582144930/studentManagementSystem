//
//  LoginViewController.h
//  ios学生管理系统
//
//  Created by tuqiangyao on 2018/8/7.
//  Copyright © 2018年 tuqiangyao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "registerViewController.h"

@interface LoginViewController : UIViewController <RegisterViewControllerDelegate>
{
    UIButton *loginButton;
    UIButton *registerButton;
    UIImage *_userImage;
    UIImage *_passImage;
}
@property (nonatomic, strong) UITextField *userTextField;
@property (nonatomic, strong) UITextField *passTextField;
@property (nonatomic, strong) UILabel *nameLable;
@property (nonatomic, strong) NSMutableArray *LoginMutableArray;
@property (nonatomic, strong) NSMutableArray *array;

@end
