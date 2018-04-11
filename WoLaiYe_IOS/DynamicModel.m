//
//  DynamicModel.m
//  WoLaiYe_IOS
//
//  Created by 鲁征东 on 16/6/14.
//  Copyright © 2016年 kzk. All rights reserved.
//

#import "DynamicModel.h"
#import "DynamicCell.h"
@implementation DynamicModel


-(CGFloat)cellHight{
    DynamicCell* cell = [[DynamicCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
   _cellHight = [cell rowHeightWithCellModel:self];
    NSLog(@"DynamicModel.h===cellHight%f",_cellHight);
    return _cellHight;
}
@end
