//
//  collectTableViewCell.h
//  WoLaiYe_IOS
//
//  Created by yugang on 16/6/6.
//  Copyright © 2016年 kzk. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CollectModel;

static NSString *cell_identifier =@"cellID";

@interface collectTableViewCell : UITableViewCell

@property (nonatomic,strong) CollectModel *collectModel;

@property(nonatomic,strong)UIButton *share_btn;
@property(nonatomic,strong)UIButton *garbage_btn;


-(CGFloat)rowHeightWithCellModel:(CollectModel *)collectModel;

@end
