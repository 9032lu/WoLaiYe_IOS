//
//  TopicTableViewCell.h
//  WoLaiYe_IOS
//
//  Created by yugang on 16/6/2.
//  Copyright © 2016年 kzk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TopicModel.h"

static NSString *identifier = @"cellID";

@interface TopicTableViewCell : UITableViewCell
@property(nonatomic,weak)UIImageView *back_Img;//背景图片
@property(nonatomic,weak)UILabel *descrip_lab;//标题


@property(nonatomic,strong) TopicModel *model;

-(CGFloat)cellHeightWithModel:(TopicModel*)model;


@end
