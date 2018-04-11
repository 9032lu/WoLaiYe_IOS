//
//  HearTableViewCell.m
//  WoLaiYe_IOS
//
//  Created by yugang on 16/6/3.
//  Copyright © 2016年 kzk. All rights reserved.
//


/*******    我在XXXXXX         ************************/
#import "HearTableViewCell.h"
#import "Header.h"
#define cellHight  [UIScreen mainScreen].bounds.size.width*0.5
@implementation HearTableViewCell
{
    SCREEN_WIDTH_AND_HEIGHT
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];

    if (self) {
        [self setupUI];
    }
    
    return self;
}


-(void)setupUI{
    _width =[UIScreen mainScreen].bounds.size.width;
    
    UIView *back_V = [[UIView alloc]initWithFrame:CGRectMake(5, 0, _width-10, cellHight-10)];
    back_V.layer.borderWidth = 2;
    back_V.layer.borderColor = APP_ClOUR.CGColor;
    [self addSubview:back_V];
    
    UIView *top_Back= [[UIView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(back_V.frame), 30)];
    top_Back.backgroundColor = APP_ClOUR;
    [back_V addSubview:top_Back];
    
     _sign_imageV= [[UIImageView alloc]initWithFrame:CGRectMake(3, 3, 50, 24)];
    _sign_imageV.backgroundColor=[UIColor whiteColor];
    [top_Back addSubview:_sign_imageV];
    
     _lab_class = [[UILabel alloc]initWithFrame:CGRectMake(60, 0, _width*0.5, 30)];
    _lab_class.text = @"让美丽活跃值上";
    _lab_class.font = [UIFont systemFontOfSize:12];
    _lab_class.textColor=[UIColor whiteColor];
    [top_Back addSubview:_lab_class];
    
    for (int i = 0; i< 4; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(CGRectGetWidth(back_V.frame)-4-(4-i)*30, 0, 30, 30);
        [top_Back addSubview:button];
        
        
        UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake((30-17)/2, 3, 17, 24)];
      
        img.backgroundColor=[UIColor greenColor];
        [button addSubview:img];
        
        if (i==0) {
            self.startBtn = button;
        }else if (i==1){
            self.penBtn = button;

        }else if (i==2){
            self.garbageBtn = button;

        }else {
            self.shareBtn = button;

        }
        
    }
    
    
    _imageV = [[UIImageView alloc]initWithFrame:CGRectMake(2, 30, CGRectGetWidth(back_V.frame)*0.61, CGRectGetHeight(back_V.frame)-CGRectGetHeight(top_Back.frame)-2)];
    _imageV.backgroundColor =[UIColor greenColor];
    [back_V addSubview:_imageV];
    
    
    for (int i =0; i < 6; i ++) {
        UILabel *lable_S = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_imageV.frame)+5, CGRectGetMinY(_imageV.frame)+7.5+(CGRectGetHeight(_imageV.frame)-15)/6*i, CGRectGetWidth(back_V.frame)*0.39-10, (CGRectGetHeight(_imageV.frame)-15)/6)];
        lable_S.font =[UIFont systemFontOfSize:13];
        [back_V addSubview:lable_S];
        
        switch (i) {
            case 0:
                lable_S.text = [NSString stringWithFormat:@"状态:%@",@"正常交易"];
   
                break;
            case 1:
                lable_S.text = [NSString stringWithFormat:@"被浏览:%@",@"506"];

                break;
            case 2:
                lable_S.text = [NSString stringWithFormat:@"被收藏:%@",@"323"];

                break;
            case 3:
                lable_S.text = [NSString stringWithFormat:@"交易成功:%@",@"32"];

                break;
            case 4:
                lable_S.text = [NSString stringWithFormat:@"价格:%@元",@"3344"];

                break;

            case 5:
                lable_S.text = [NSString stringWithFormat:@"创建时间:%@",@"2016/02/03"];

                break;
    

            default:
                break;
        }
        
    }
    
    
    
    
    
    
    
    
}


@end
