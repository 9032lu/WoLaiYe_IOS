//
//  CollectModel.m
//  WoLaiYe_IOS
//
//  Created by yugang on 16/6/6.
//  Copyright © 2016年 kzk. All rights reserved.
//

#import "CollectModel.h"
#import "collectTableViewCell.h"
@implementation CollectModel


-(CGFloat)cellHeight{
    collectTableViewCell *cell = [[collectTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cell_identifier];
    
    _cellHeight = [cell rowHeightWithCellModel:self];
    return _cellHeight;
    
}
@end
