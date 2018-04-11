//
//  DynamicCell.h
//  WoLaiYe_IOS
//
//  Created by 鲁征东 on 16/6/14.
//  Copyright © 2016年 kzk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DynamicModel.h"



static NSString *cellID = @"cellID";

@interface DynamicCell : UITableViewCell

@property (nonatomic,strong) DynamicModel *dynamicModel;

@property(nonatomic,strong)UIButton *share_btn;
@property(nonatomic,strong)UIButton *collect_btn;




-(CGFloat)rowHeightWithCellModel:(DynamicModel *)dynamicModel;


@end
