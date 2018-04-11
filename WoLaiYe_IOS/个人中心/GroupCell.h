//
//  GroupCell.h
//  WoLaiYe_IOS
//
//  Created by yugang on 16/6/3.
//  Copyright © 2016年 kzk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GroupCell : UITableViewCell
@property(nonatomic,strong)UIImageView *sign_imageV;//标签
@property(nonatomic,strong)UILabel *lab_class;//标签描述
@property(nonatomic,strong)UIButton *peopleBtn;//开始
@property(nonatomic,strong)UIButton *setBtn;//铅笔
//@property(nonatomic,strong)UIButton *garbageBtn;//删除
@property(nonatomic,strong)UIButton *shareBtn;//分享

@property(nonatomic,strong)UIImageView *imageV;//大图



@property(nonatomic,copy)NSString *state_S;//状态
@property(nonatomic,copy)NSString *peopleCount_S;//浏览
@property(nonatomic,copy)NSString *service_S;//收藏
//@property(nonatomic,copy)NSString *success_S;//交易成功
@property(nonatomic,copy)NSString *position_S;//价格
@property(nonatomic,copy)NSString *date_S;//时间

@end
