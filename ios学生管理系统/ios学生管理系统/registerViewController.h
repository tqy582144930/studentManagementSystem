//
//  registerViewController.h
//  ios学生管理系统
//
//  Created by tuqiangyao on 2018/8/9.
//  Copyright © 2018年 tuqiangyao. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RegisterViewControllerDelegate<NSObject>
- (void)sendValue:(NSString *) UserString andValue:(NSString *) passString;
@end

@interface registerViewController : UIViewController {
    UIImage *_userImage;
    UIImage *_passImage;
}
@property (nonatomic, strong)UITextField *UserTextField;
@property (nonatomic, strong)UITextField *PassTextField;
@property (nonatomic, strong)NSMutableArray *personMutableArray;
@property (nonatomic, weak)id<RegisterViewControllerDelegate>delegate;


@end
