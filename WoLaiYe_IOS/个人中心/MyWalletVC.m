//
//  MyWalletVC.m
//  WoLaiYe_IOS
//
//  Created by yugang on 16/6/3.
//  Copyright © 2016年 kzk. All rights reserved.
//

#import "MyWalletVC.h"
#import "Header.h"
@interface MyWalletVC ()<UITableViewDelegate,UITableViewDataSource>
{
    SCREEN_WIDTH_AND_HEIGHT
    NSArray *array_A;
}

@property(nonatomic,strong) UITableView *tabel_view;

@end

@implementation MyWalletVC

- (void)viewDidLoad {
    [super viewDidLoad];
    TOP_VIEW(@"我的钱包")
    array_A = @[@"提现",@"收支明细",@"银行卡管理",@"密码管理"];
    _tabel_view =[[UITableView alloc]initWithFrame:CGRectMake(0, 64, _width, _height-64) style:UITableViewStyleGrouped];
    _tabel_view.delegate = self;
    _tabel_view.dataSource  = self;
    [self.view addSubview:_tabel_view];
   
    
 }


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 150;
    
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{

    UIView *back_V = [UIView new];
    back_V.backgroundColor = [UIColor darkGrayColor];
//    UILabel *balance_lab = [UILabel alloc]inde
    
    UILabel *lable_example = [[UILabel alloc]initWithFrame:CGRectMake(15, 20, _width, 30)];
    lable_example.textColor = [UIColor orangeColor];
    lable_example.text=@"余额:";
    lable_example.textAlignment = NSTextAlignmentLeft;
    lable_example.font = [UIFont boldSystemFontOfSize:17];
    [back_V addSubview:lable_example];
    
    UILabel *balance_lab = [[UILabel alloc]initWithFrame:CGRectMake(30, 0, _width, 130)];
    balance_lab.textColor = [UIColor orangeColor];
      balance_lab.text=@"355.9元";
    balance_lab.textAlignment = NSTextAlignmentLeft;
    balance_lab.font = [UIFont boldSystemFontOfSize:40];
    [back_V addSubview:balance_lab];
    
    UILabel *lab_L = [[UILabel alloc]initWithFrame:CGRectMake(0, 100, _width-20, 50)];
    lab_L.textColor = [UIColor orangeColor];
    lab_L.text=@"剩余:23423.3元";
    lab_L.textAlignment = NSTextAlignmentRight;
    lab_L.font = [UIFont boldSystemFontOfSize:17];
    [back_V addSubview:lab_L];


    return back_V;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return array_A.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"cellID";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.textLabel.text = array_A[indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
}

-(void)backClick{
    POP
}

-(NSString *)getTheNoNullStr:(id)str andRepalceStr:(NSString*)replace{
    NSString *string=nil;
    if (![str isKindOfClass:[NSNull class]]) {
        string =  [NSString stringWithFormat:@"%@",str];
        
        if (string.length ==0||(NSNull*)string == [NSNull null]||[string containsString:@"null"]) {
            string =replace;
            
        }
    }else{
        string =replace;
    }
    return string;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
