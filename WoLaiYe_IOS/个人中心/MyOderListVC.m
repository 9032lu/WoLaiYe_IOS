//
//  MyOderListVC.m
//  WoLaiYe_IOS
//
//  Created by yugang on 16/6/3.
//  Copyright © 2016年 kzk. All rights reserved.
//

#import "MyOderListVC.h"
#import "Header.h"
#import "OrderListCell.h"

@interface MyOderListVC ()<UITableViewDelegate,UITableViewDataSource>
{
    SCREEN_WIDTH_AND_HEIGHT
    UIButton *oldBtn;
    UIButton *selectBtn;

    UIView *move_line;
}

@property(nonatomic,strong)UITableView *table_view;

@end

@implementation MyOderListVC
-(void)backClick{
    POP
}
- (void)viewDidLoad {
    [super viewDidLoad];
    TOP_VIEW(@"我的订单");
    
    NSArray *array=@[@"我的销售订单",@"我的购买订单"];
    for (int i =0; i < array.count; i ++) {
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(1+_width/array.count*i, 66, (_width-4)/array.count, 40)];
        button.layer.borderColor = APP_ClOUR.CGColor;
        button.layer.borderWidth = 2;
       
        [button setTitle:array[i] forState:UIControlStateNormal];
        
        
//        [button setTitleColor:APP_ClOUR forState:UIControlStateNormal];
//        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        
        button.tag = i;
        [button addTarget:self action:@selector(changeClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
        
        if (i==0) {
            button.selected = YES;
            button.backgroundColor = APP_ClOUR;
            
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
            
            oldBtn.backgroundColor = [UIColor whiteColor];
            oldBtn = button;
        }else{
            button.backgroundColor = [UIColor whiteColor];
            [button setTitleColor:APP_ClOUR forState:UIControlStateNormal];
            [button setTitleColor:APP_ClOUR forState:UIControlStateSelected];
        }

    }
    
    NSArray*title_a=@[@"全部",@"待支付",@"待结单",@"待确认",@"待评论"];
    
    for (int i=0; i<title_a.count; i++) {
        UIButton*button=[UIButton buttonWithType:UIButtonTypeCustom];
        button.frame=CGRectMake(_width/title_a.count*i, 104, _width/title_a.count, 40);
         [button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        
     [button setTitle:[title_a objectAtIndex:i] forState:UIControlStateNormal];
        button.titleLabel.font=[UIFont systemFontOfSize:14];
        button.tag=i;
        [button addTarget:self action:@selector(selectBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:button];
        
        if (i==0) {
             move_line = [[UIView alloc]initWithFrame:CGRectMake(_width*0.05, 141, _width*0.1, 3)];
            move_line.backgroundColor = APP_ClOUR;
            [self.view addSubview:move_line];

        }

        
    }
    
    UIView*hengxian=[[UIView alloc]initWithFrame:CGRectMake(0, 144, _width, 1)];
    
    hengxian.backgroundColor=RGB(234, 234, 234);
    [self.view addSubview:hengxian];

    
    
    _table_view = [[UITableView alloc]initWithFrame:CGRectMake(0, 145, _width, _height-145) style:UITableViewStyleGrouped];
    _table_view.delegate= self;
    _table_view.dataSource = self;
    _table_view.separatorStyle= UITableViewCellSeparatorStyleNone;
    _table_view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_table_view];
    
    
    
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return _width*0.12+118;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"cellID";
    
    OrderListCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell==nil) {
        cell = [[OrderListCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    
    cell.chart_btn.tag = cell.report_btn.tag = indexPath.row;
    [cell.chart_btn addTarget:self action:@selector(chartClick:) forControlEvents:UIControlEventTouchUpInside];
    [cell.report_btn addTarget:self action:@selector(reportClick:) forControlEvents:UIControlEventTouchUpInside];

    return cell;
    
}

-(void)chartClick:(UIButton*)sender{
    NSLog(@"聊天");
}
-(void)reportClick:(UIButton*)sender{
    NSLog(@"举报");
}
-(void)selectBtnClick:(UIButton*)sender{
    
    [UIView animateWithDuration:0.5 animations:^{
        move_line.frame = CGRectMake(_width*0.05+_width*0.2*sender.tag, 141, _width*0.1, 3);

    }];
    
    
    
}
-(void)changeClick:(UIButton*)sender{
    
    if (oldBtn !=sender) {
        sender.selected = YES;
        oldBtn.selected = NO;
        
        [sender setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [sender setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        
        [oldBtn setTitleColor:APP_ClOUR forState:UIControlStateNormal];
        [oldBtn setTitleColor:APP_ClOUR forState:UIControlStateSelected];
        
        sender.backgroundColor = APP_ClOUR;
        
        oldBtn.backgroundColor = [UIColor whiteColor];
        oldBtn = sender;
    }else{
        sender.backgroundColor = APP_ClOUR;
        [sender setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [sender setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    }
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
