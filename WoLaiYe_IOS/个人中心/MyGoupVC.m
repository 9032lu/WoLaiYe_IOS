//
//  MyGoupVC.m
//  WoLaiYe_IOS
//
//  Created by yugang on 16/6/3.
//  Copyright © 2016年 kzk. All rights reserved.
//

#import "MyGoupVC.h"
#import "Header.h"
#import "GroupCell.h"
@interface MyGoupVC ()<UITableViewDelegate,UITableViewDataSource>
{
    SCREEN_WIDTH_AND_HEIGHT
}
@property(nonatomic,strong)UITableView *tabel_view;

@end

@implementation MyGoupVC

-(void)backClick{
    POP
}
- (void)viewDidLoad {
    [super viewDidLoad];

    TOP_VIEW(@"我的组织")
    _tabel_view =[[UITableView alloc]initWithFrame:CGRectMake(0, 64, _width, _height-64) style:UITableViewStyleGrouped];
    _tabel_view.delegate = self;
    _tabel_view.dataSource  = self;
    _tabel_view.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tabel_view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_tabel_view];

}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 3;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return _width*0.4;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
    
}


-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"cellID";
    
    GroupCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[GroupCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.peopleBtn.tag=cell.setBtn.tag=cell.shareBtn.tag = indexPath.row;
    
    [cell.peopleBtn addTarget:self action:@selector(peopleClick:) forControlEvents:UIControlEventTouchUpInside];
    [cell.setBtn addTarget:self action:@selector(setClick:) forControlEvents:UIControlEventTouchUpInside];
    [cell.shareBtn addTarget:self action:@selector(shareClick:) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
}


-(void)peopleClick:(UIButton*)sender{
    NSLog(@"群");
}
-(void)setClick:(UIButton*)sender{
    NSLog(@"设置");
}

-(void)shareClick:(UIButton*)sender{
    NSLog(@"分享");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
