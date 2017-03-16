//
//  MJTabBarViewController.m
//  MJLeftQQDemo
//
//  Created by none on 17/3/16.
//  Copyright © 2017年 mj. All rights reserved.
//

#import "MJTabBarViewController.h"
#import "MJViewController.h"

@interface MJTabBarViewController ()

@end

@implementation MJTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self initChildVC];
}
-(void)initChildVC{
    //添加子控制器
    MJViewController *home = [MJViewController new];
    [self addChildVc:home title:@"首页" image:@"footer_nav_icon_home" selectedImage:@"footer_nav_icon_home1"];
    
    MJViewController *friend = [MJViewController new];
    [self addChildVc:friend title:@"圈圈" image:@"footer_nav_icon_area" selectedImage:@"footer_nav_icon_area1"];
    
    MJViewController *purchase = [MJViewController new];
    [self addChildVc:purchase title:@"购购" image:@"footer_nav_icon_buy" selectedImage:@"footer_nav_icon_buy1"];
    
    MJViewController *center = [MJViewController new];
    [self addChildVc:center title:@"我的" image:@"footer_nav_icon_mine" selectedImage:@"footer_nav_icon_mine1"];
}

/**
 *  添加一个子控制器
 *
 *  @param childVc       子控制器
 *  @param title         标题
 *  @param image         图片
 *  @param selectedImage 选中的图片
 */
- (void)addChildVc:(UIViewController *)childVc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    // 设置子控制器的文字和图片
    childVc.title = title;
    childVc.tabBarItem.image = [UIImage imageNamed:image];
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:childVc];
    
    [self addChildViewController:nav];
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
