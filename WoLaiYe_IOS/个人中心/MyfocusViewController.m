//
//  MyfocusViewController.m
//  WoLaiYe_IOS
//
//  Created by yugang on 16/6/3.
//  Copyright © 2016年 kzk. All rights reserved.
//

#import "MyfocusViewController.h"
#import "Header.h"
@interface MyfocusViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    SCREEN_WIDTH_AND_HEIGHT
    NSArray *array_A;

}
@property(nonatomic,strong) UITableView *tabel_view;
@end

@implementation MyfocusViewController

-(void)backClick{
    POP
}
- (void)viewDidLoad {
    [super viewDidLoad];
    TOP_VIEW(@"我的关注")
    array_A = @[@"组织消息",@"系统消息",@"什么都不重要",@"密码管理",@"什么都不重要",@"什么都不重要",@"什么都不重要",@"什么都不重要",@"什么都不重要"];
    _tabel_view =[[UITableView alloc]initWithFrame:CGRectMake(0, 64, _width, _height-64) style:UITableViewStyleGrouped];
    _tabel_view.delegate = self;
    _tabel_view.dataSource  = self;
//    _tabel_view.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tabel_view];
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return array_A.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
     static NSString *identifier = @"cellID";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
        cell.textLabel.font = [UIFont systemFontOfSize:15];
        cell.detailTextLabel.font = [UIFont systemFontOfSize:10];
        cell.detailTextLabel.textColor = [UIColor lightGrayColor];
//        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 59, _width, 1)];
//        view.backgroundColor = [UIColor lightGrayColor];
//        [cell.contentView addSubview:view];

    }
      cell.imageView.image= [UIImage imageNamed:@"QQ20160603-0@2x"];
    cell.textLabel.text = array_A[indexPath.row];
    cell.detailTextLabel.text = @"水电费水电费是";
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
