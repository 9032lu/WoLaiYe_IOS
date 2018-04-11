//
//  GroupCell.m
//  WoLaiYe_IOS
//
//  Created by yugang on 16/6/3.
//  Copyright © 2016年 kzk. All rights reserved.
//

#import "GroupCell.h"
#import "Header.h"
#define cellHight  [UIScreen mainScreen].bounds.size.width*0.4

@implementation GroupCell
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
    
    _sign_imageV= [[UIImageView alloc]initWithFrame:CGRectMake(3, 3, 60, 24)];
    _sign_imageV.backgroundColor=[UIColor whiteColor];
    [top_Back addSubview:_sign_imageV];
    
    _lab_class = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_sign_imageV.frame)+10, 0, _width*0.5, 30)];
    _lab_class.text = @"音乐爱好者部落";
    _lab_class.font = [UIFont systemFontOfSize:12];
    _lab_class.textColor=[UIColor whiteColor];
    [top_Back addSubview:_lab_class];
    
    for (int i = 0; i< 3; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(CGRectGetWidth(back_V.frame)-4-(3-i)*30, 0, 40, 30);
        [top_Back addSubview:button];
        
        
        UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake((40-25)/2, 3, 25, 25)];
        
        img.backgroundColor=[UIColor greenColor];
        [button addSubview:img];
        
        if (i==0) {
            self.peopleBtn = button;
        }else if (i==1){
            self.setBtn = button;
            
//        }else if (i==2){
//            self.garbageBtn = button;
            
        }else {
            self.shareBtn = button;
            
        }
        
    }
    
    
    _imageV = [[UIImageView alloc]initWithFrame:CGRectMake(10, 30+10, CGRectGetHeight(back_V.frame)-CGRectGetHeight(top_Back.frame)-2-20, CGRectGetHeight(back_V.frame)-CGRectGetHeight(top_Back.frame)-2-20)];
    _imageV.backgroundColor =[UIColor greenColor];
    [back_V addSubview:_imageV];
    
    
    for (int i =0; i < 5; i ++) {
        UILabel *lable_S = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_imageV.frame)+20, CGRectGetMinY(_imageV.frame)+(CGRectGetHeight(_imageV.frame))/5*i, CGRectGetWidth(back_V.frame), (CGRectGetHeight(_imageV.frame))/5)];
        lable_S.font =[UIFont systemFontOfSize:11];
        [back_V addSubview:lable_S];
        
        switch (i) {
            case 0:
                lable_S.text = [NSString stringWithFormat:@"等级:%@",@"4级"];
                
                break;
            case 1:
                lable_S.text = [NSString stringWithFormat:@"人数:%@",@"5人"];
                
                break;
            case 2:
                lable_S.text = [NSString stringWithFormat:@"服务:%@",@"323项"];
                
                break;
            case 3:
                lable_S.text = [NSString stringWithFormat:@"创建时间:%@",@"2016/02/03"];
                
                break;
            case 4:
                lable_S.text = [NSString stringWithFormat:@"位置:%@",@"西安市雁塔区"];
                
                break;
                
//            case 5:
//                lable_S.text = [NSString stringWithFormat:@"创建时间:%@",@"2016/02/03"];
//                
//                break;
                
                
            default:
                break;
        }
        
    }
    
    
    
    
    
    
    
    
}


@end
