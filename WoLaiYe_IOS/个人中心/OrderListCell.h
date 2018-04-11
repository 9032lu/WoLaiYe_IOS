//
//  OrderListCell.h
//  WoLaiYe_IOS
//
//  Created by yugang on 16/6/6.
//  Copyright © 2016年 kzk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderListCell : UITableViewCell


@property(nonatomic,strong)UIImageView *person_Img;//用户头像
@property(nonatomic,strong)UILabel *person_name;//用户名
@property(nonatomic,strong)UILabel *person_state;//用户状态

@property(nonatomic,strong)UILabel *time_Lab; //时间
@property(nonatomic,strong)UILabel *order_state; //订单状态

@property(nonatomic,strong)UIButton *report_btn; //举报
@property(nonatomic,strong)UIButton *chart_btn; //聊天

@property(nonatomic,strong)UILabel *title_lab; //标题
@property(nonatomic,strong)UILabel *price_lab; //价格


@property(nonatomic,strong)UIImageView *order_img;



@property(nonatomic,assign)CGFloat cellHeight;


@end
