//
//  MJViewController.m
//  MJLeftQQDemo
//
//  Created by none on 17/3/16.
//  Copyright © 2017年 mj. All rights reserved.
//

#import "MJViewController.h"
#import "AppDelegate.h"

@interface MJViewController ()

@end

@implementation MJViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor redColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Menu" style:UIBarButtonItemStylePlain target:self action:@selector(menuBtnClicked:)];
}

#pragma mark - button actions
- (void)menuBtnClicked:(UIBarButtonItem *)item {
    AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [app.slideVC switchMenu];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self dismissViewControllerAnimated:YES completion:nil];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"POSTDIDDISMISS" object:nil];
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
