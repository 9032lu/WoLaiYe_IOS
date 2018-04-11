//
//  HomeViewController.m
//  WoLaiYe_IOS
//
//  Created by yugang on 16/6/1.
//  Copyright © 2016年 kzk. All rights reserved.
//

#import "HomeViewController.h"
#import "Header.h"
#import"define.h"
#import "TopicTableViewCell.h"
#import "myView.h"

@interface HomeViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    SCREEN_WIDTH_AND_HEIGHT
    
    UIView *sort_lineView;
    UIButton *sort_oldBtn;//分类按钮
    
    
}

@property(nonatomic,strong)NSMutableArray *arr_models;//存放model的数量
@end

@implementation HomeViewController
//分类
//懒加载
-(NSMutableArray*)arr_models{
    if (!_arr_models) {
        _arr_models = [NSMutableArray array];
    }
    
    return _arr_models;
}
//懒加载

-(NSMutableArray*)sort_Arr{
    if (!_sort_Arr) {
        _sort_Arr = [[NSMutableArray alloc]init];
    }
    return _sort_Arr;
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden= YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    SCREEN
    //请求数据
    [self getData];
    
}

-(void)getData{
    NSString *url = @"http://114.215.192.80:10123/App/index.aspx?t=home";
    
    LOADVIEW
    [requestData PostData:url Parameters:nil Completion:^(NSError *error, NSDictionary *resultDict) {

        LOADREMOVE
        if ([resultDict[@"Flag"]integerValue]==1) {
            self.data_Array = resultDict[@"Data"];

        }else{

        }
        if (_data_Array.count!=0) {
            _header_dic =self.data_Array[0];
        
            NSArray *array=[[_header_dic[@"buttons"]objectAtIndex:0]objectForKey:@"items"];
            //字典转模型
            for (NSDictionary *dic in array) {
                TopicModel *model = [[TopicModel alloc]initWithDictionary:dic];
                
                [self.arr_models addObject:model];
               
            }
            
            

        }
        [_table_view reloadData];
    }];


}

//分类的点击事件
-(void)sortClick:(UIButton*)sender{
    if (sender !=sort_oldBtn) {
        sort_oldBtn = sender;
        [UIView animateWithDuration:0.5 animations:^{
            sort_lineView.center = CGPointMake(sender.center.x, CGRectGetMaxY(sender.frame)-12);
        }];
        
        NSArray *array=[[_header_dic[@"buttons"]objectAtIndex:sender.tag]objectForKey:@"items"];
        
        [self.arr_models removeAllObjects];
        
        for (NSDictionary *dic in array) {
            TopicModel *model = [[TopicModel alloc]initWithDictionary:dic];
            
            [self.arr_models addObject:model];
            
        }

        
        NSIndexSet *indexSet=[[NSIndexSet alloc]initWithIndex:1];
        [_table_view reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
    }
    
    
}

-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *footer = [[UIView alloc]init];
    footer.backgroundColor = [UIColor redColor];
    if (section==0) {
        [self.sort_Arr removeAllObjects];
        NSArray *arr =_header_dic [@"buttons"];
        for (NSDictionary *dic in arr) {
            [self.sort_Arr addObject:dic[@"text"]];
        }
        for (int i =0; i<_sort_Arr.count; i ++) {
            
            UILabel *lab = [[UILabel alloc]init];
            lab.frame = CGRectMake(10+i*_width*0.15, 11, _width*0.15, 22);
            lab.text = _sort_Arr[i];
            lab.textColor =[UIColor whiteColor];
            lab.textAlignment = NSTextAlignmentCenter;
            lab.font = [UIFont systemFontOfSize:15];
            [footer addSubview:lab];
            
            UIButton *sort_Btn = [UIButton buttonWithType:UIButtonTypeCustom];
            sort_Btn.frame = CGRectMake(10+i*_width*0.15, 0, _width*0.15, 44);
            [sort_Btn addTarget:self action:@selector(sortClick:) forControlEvents:UIControlEventTouchUpInside];
            sort_Btn.tag= i;
            [footer addSubview:sort_Btn];
            
            if (i==0) {
                
                sort_oldBtn = sort_Btn;
                sort_lineView = [[UIView alloc]init];
                sort_lineView.bounds = CGRectMake(0, 0, _width*0.1, 2);
                sort_lineView.center = CGPointMake(lab.center.x, CGRectGetMaxY(lab.frame)+1);
                sort_lineView.backgroundColor = [UIColor whiteColor];
                [footer addSubview:sort_lineView];
                
            }
            
        }
        
    }
    return footer;
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *header = [[UIView alloc]init];
    header.backgroundColor = [UIColor greenColor];
    
    for (UIView *subv in header.subviews) {
        [subv removeFromSuperview];
    }
    if (section==0) {
        UIImageView *back_img = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, _width, _width*0.7)];
        [header addSubview:back_img];
        
        [back_img sd_setImageWithURL:[NSURL URLWithString:_header_dic[@"image"]] placeholderImage:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            
        }];

    }
    
    return header;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section==0) {
        return  _width*0.7;

    }else{
        return 0.1;
    }
        
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section==0) {
        return  44;
        
    }else{
        return 0.1;
    }

}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
        return 0;
    }else{
        
        return self.arr_models.count;

    }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}



-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section ==1) {
        return _width*0.5;

    }else{
        return 0.1;
    }
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    

    TopicTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[TopicTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;

    }

    
    if (indexPath.section ==1) {
        TopicModel *topModel =self.arr_models[indexPath.row];
        if (_arr_models.count!=0) {
            
            cell.backgroundColor =[UIColor darkGrayColor];
            cell.model = topModel;

        }

    
    }
    
    

    return cell;
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{



}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
