//
//  OrderListCell.m
//  WoLaiYe_IOS
//
//  Created by yugang on 16/6/6.
//  Copyright © 2016年 kzk. All rights reserved.
//


#define cellHight  ([UIScreen mainScreen].bounds.size.width*0.12+118)

#import "OrderListCell.h"
#import "Header.h"
@implementation OrderListCell
{
    SCREEN_WIDTH_AND_HEIGHT
}



-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self initsubviews];
    }
    
    return self;
}

-(void)initsubviews{
    _width =[UIScreen mainScreen].bounds.size.width;

    UIView *back_view = [[UIView alloc]init];
    back_view.backgroundColor =APP_ClOUR;
    back_view.frame =  CGRectMake(2, 2, _width-4, cellHight-4);

    [self addSubview:back_view];
    
    
    _person_Img = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, _width*0.12, _width*0.12)];
    _person_Img.backgroundColor = [UIColor whiteColor];
    _person_Img.layer.cornerRadius = _width*0.06;
    _person_Img.clipsToBounds = YES;
    [self addSubview:_person_Img];
    
    _person_name= [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_person_Img.frame)+5, CGRectGetMidY(_person_Img.frame)-20, _width*0.37,20)];
    _person_name.text = @"猪八戒";
    _person_name.textColor = [UIColor whiteColor];
    _person_name.font= [UIFont systemFontOfSize:14];
    [self addSubview:_person_name];
    
    UIImageView *sign_img = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMinX(_person_name.frame), CGRectGetMidY(_person_Img.frame), 15, 15)];
    sign_img.backgroundColor = [UIColor whiteColor];
    [self addSubview:sign_img];
    
    _person_state = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(sign_img.frame)+3, CGRectGetMinY(sign_img.frame), _width, 15)];
    _person_state.textColor = [UIColor whiteColor];
    _person_state.text = @"已完成实名认证";
    _person_state.font = [UIFont systemFontOfSize:10];
    [self addSubview:_person_state];
    
    _time_Lab = [[UILabel alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(_person_Img.frame)+3, _width, 20)];
    _time_Lab.text = @"2016/06/07/17:32";
    _time_Lab.textColor =[UIColor whiteColor];
    _time_Lab.font = [UIFont systemFontOfSize:14];
    [self addSubview:_time_Lab];
    
    
    _order_state = [[UILabel alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(_time_Lab.frame)+3, _width*0.3, 20)];
    _order_state.text = @"状态:代付款";
    _order_state.textColor =[UIColor whiteColor];
    _order_state.font = [UIFont systemFontOfSize:16];
    [self addSubview:_order_state];
    
    _report_btn = [[UIButton alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(_order_state.frame), _width*0.3, 25)];
    [_report_btn setTitle:@"X举报" forState:UIControlStateNormal];
    _report_btn.titleLabel.font = [UIFont systemFontOfSize:15];
    [_report_btn setTitleColor:APP_ClOUR forState:UIControlStateNormal];
    _report_btn.backgroundColor = [UIColor whiteColor];
    [self addSubview:_report_btn];
    
    _chart_btn = [[UIButton alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(_report_btn.frame)+2, _width*0.3, 25)];
    [_chart_btn setTitle:@"和TA聊聊" forState:UIControlStateNormal];
    _chart_btn.titleLabel.font = [UIFont systemFontOfSize:15];
    [_chart_btn setTitleColor:APP_ClOUR forState:UIControlStateNormal];
    _chart_btn.backgroundColor = [UIColor whiteColor];
    [self addSubview:_chart_btn];
    
    NSLog(@"------%f",_width);
    
    UIView *shuxian = [[UIView alloc]initWithFrame:CGRectMake(_width*0.45, 20, 3, CGRectGetHeight(back_view.frame)-40)];
    shuxian.backgroundColor =[UIColor whiteColor];
    [back_view addSubview:shuxian];
    
    if (_width>320) {
        shuxian.frame = CGRectMake(_width*0.4, 20, 3, CGRectGetHeight(back_view.frame)-40);
    }

    _title_lab = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(shuxian.frame)+10, 0, _width*0.4, 40)];
    
    _title_lab.text = @"让美丽与那人那";
    _title_lab.font = [UIFont boldSystemFontOfSize:15];
    _title_lab.textColor= [UIColor whiteColor];
    [back_view addSubview:_title_lab];
    
    
    _price_lab = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(back_view.frame)-10, 40)];
    _price_lab.text = @"66元";
    _price_lab.font = [UIFont boldSystemFontOfSize:15];
    _price_lab.textColor= [UIColor orangeColor];
    _price_lab.textAlignment = NSTextAlignmentRight;
    [back_view addSubview:_price_lab];

    _order_img = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(shuxian.frame)+10, 40, CGRectGetWidth(back_view.frame)-CGRectGetMaxX(shuxian.frame)-15, CGRectGetMaxY(_chart_btn.frame)-40)];
    _order_img.backgroundColor =[UIColor whiteColor];
    [self addSubview:_order_img];
    
    
}


-(CGSize)boundWithSize:(CGSize)size  WithLabel:(UILabel*)label
{
    NSDictionary *attribute = @{NSFontAttributeName: label.font};
    
    CGSize retSize = [label.text boundingRectWithSize:size
                                              options:\
                      NSStringDrawingTruncatesLastVisibleLine |
                      NSStringDrawingUsesLineFragmentOrigin |
                      NSStringDrawingUsesFontLeading
                                           attributes:attribute
                                              context:nil].size;
    
    return retSize;
}

@end
