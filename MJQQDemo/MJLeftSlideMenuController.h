//
//  MJSlideMenuController.h
//  MJLeftQQDemo
//
//  Created by none on 17/3/16.
//  Copyright © 2017年 mj. All rights reserved.
//

/**
 *  仿照QQ侧边菜单栏
 */

#import <UIKit/UIKit.h>

@interface MJLeftSlideMenuController : UIViewController

/// init methods
- (instancetype)initWithMainVC:(UIViewController *)mainVC leftMenuVC:(UIViewController *)leftMenuVC;

/// open / close menu
- (void)switchMenu;

@end
