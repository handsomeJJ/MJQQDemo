//
//  MenuViewController.m
//  MJLeftQQDemo
//
//  Created by none on 17/3/16.
//  Copyright © 2017年 mj. All rights reserved.
//

#import "MenuViewController.h"
#import "UIView+Extension.h"

#define HEADERHEIGHT 200

@interface MenuViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(strong,nonatomic)UITableView *tableView;
@property(weak,nonatomic)UIView *headView;
@property(weak,nonatomic)UIImageView *headImageView;
@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    
    [self setUpHeader];
}
-(void)setUpHeader{
    
     UIView *headView = [[UIView alloc]init];
    _headView = headView;
    headView.backgroundColor = [UIColor cyanColor];
    headView.frame = CGRectMake(0, 0, self.view.bounds.size.width, HEADERHEIGHT);
    [self.view addSubview:headView];
    
    UIImageView *imageV = [[UIImageView alloc]init];
    imageV.frame = headView.bounds;
    imageV.contentMode = UIViewContentModeScaleAspectFit;
    [headView addSubview:imageV];
    _headImageView = imageV;
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    CGFloat offset = scrollView.contentOffset.y + scrollView.contentInset.top;
    NSLog(@"offset  %f",offset);
    if (offset <= 0.0) {
        // 向下拉 放大
        _headView.y = 0;
        _headView.height = HEADERHEIGHT - offset;
        _headImageView.height = _headView.height;
        
    }else{
        // 向上拉 移动
        _headView.height = HEADERHEIGHT;
        _headImageView.height = _headView.height;
        
        CGFloat min = HEADERHEIGHT - 64;
        _headView.y = - MIN(min, offset);
    }
}

#pragma mark -- delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *ID = @"mjCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor whiteColor];
    cell.textLabel.text = @(indexPath.row).stringValue;
    return cell;
}

#pragma mark -- get
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.contentInset = UIEdgeInsetsMake(HEADERHEIGHT, 0, 0, 0);
        
    }
    return _tableView;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
