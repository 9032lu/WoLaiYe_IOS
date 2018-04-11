//
//  ImhereVC.m
//  WoLaiYe_IOS
//
//  Created by yugang on 16/6/3.
//  Copyright © 2016年 kzk. All rights reserved.
//

#import "ImhereVC.h"
#import "Header.h"
#import "HearTableViewCell.h"
@interface ImhereVC ()<UITableViewDelegate,UITableViewDataSource>
{
    SCREEN_WIDTH_AND_HEIGHT
}

@property(nonatomic,strong)UITableView *tabel_view;
@end

@implementation ImhereVC

-(void)backClick{
    POP
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    TOP_VIEW(@"我在XX")
   
    UIButton *new_btn = [UIButton buttonWithType:UIButtonTypeCustom];
    new_btn.frame = CGRectMake(_width-70, 20, 60, 44);
    [new_btn setTitle:@"新建服务" forState:UIControlStateNormal];
    new_btn.titleLabel.font = [UIFont systemFontOfSize:14];
    [new_btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [new_btn addTarget:self action:@selector(addClcik) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:new_btn];
    
    UILabel *add_img = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(new_btn.frame)-15, 20+(44-15)/2, 15, 15)];
    add_img.textColor =[UIColor whiteColor];
    add_img.text = @"+";
    add_img.textAlignment = NSTextAlignmentRight;
    add_img.font=[UIFont boldSystemFontOfSize:20];
    [topView addSubview:add_img];
    
    _tabel_view =[[UITableView alloc]initWithFrame:CGRectMake(0, 64, _width, _height-64) style:UITableViewStyleGrouped];
    _tabel_view.delegate = self;
    _tabel_view.dataSource  = self;
        _tabel_view.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tabel_view];
}


-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return _width*0.3;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return _width*0.5;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *back_view = [UIView new];
    back_view.backgroundColor = [UIColor whiteColor];
    NSArray *arr = @[@"浏览人数",@"收藏人数",@"购买人数"];
    for (int i =0; i < 3; i ++) {
        UILabel *coun_lab = [[UILabel alloc]initWithFrame:CGRectMake(5+i*(_width/3), 5, (_width-30)/3, _width*0.3-10)];
//        coun_lab.backgroundColor = [UIColor greenColor];
        coun_lab.layer.borderColor = APP_ClOUR.CGColor;
        coun_lab.layer.borderWidth = 2;
        coun_lab.textColor = APP_ClOUR;
        coun_lab.text = @"506";
        coun_lab.textAlignment = NSTextAlignmentCenter;
        coun_lab.font = [UIFont boldSystemFontOfSize:30];
        [back_view addSubview:coun_lab];
        
        UILabel *Lab_des = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetHeight(coun_lab.frame)/2+10, CGRectGetWidth(coun_lab.frame), CGRectGetHeight(coun_lab.frame)/2-10)];
        Lab_des.textColor = APP_ClOUR;
        Lab_des.text = arr[i];
        Lab_des.textAlignment = NSTextAlignmentCenter;
        Lab_des.font = [UIFont boldSystemFontOfSize:17];
        [coun_lab addSubview:Lab_des];
        
    }
    
    
    return back_view;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;

}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"cellID";

    HearTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[HearTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
    cell.startBtn.tag=cell.penBtn.tag=cell.garbageBtn.tag=cell.shareBtn.tag = indexPath.row;
    
    [cell.startBtn addTarget:self action:@selector(startClick:) forControlEvents:UIControlEventTouchUpInside];
    [cell.penBtn addTarget:self action:@selector(penClick:) forControlEvents:UIControlEventTouchUpInside];
    [cell.garbageBtn addTarget:self action:@selector(garbageClick:) forControlEvents:UIControlEventTouchUpInside];
    [cell.shareBtn addTarget:self action:@selector(shareClick:) forControlEvents:UIControlEventTouchUpInside];

    return cell;

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
}

-(void)startClick:(UIButton*)sender{
    NSLog(@"开始");
}
-(void)penClick:(UIButton*)sender{
    NSLog(@"便捷");
}
-(void)garbageClick:(UIButton*)sender{
    NSLog(@"垃圾");
}
-(void)shareClick:(UIButton*)sender{
    NSLog(@"分享");
}

-(void)addClcik{
    NSLog(@"新建");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
