//
//  TopicModel.m
//  WoLaiYe_IOS
//
//  Created by 鲁征东 on 16/6/15.
//  Copyright © 2016年 kzk. All rights reserved.
//

#import "TopicModel.h"
#import "TopicTableViewCell.h"
@implementation TopicModel

-(void)setCellHeight{
    TopicTableViewCell *cell = [[TopicTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    
    
    _cellHeight = [cell cellHeightWithModel:self];

    NSLog(@"setCellHeight");
}

-(TopicModel*)initWithDictionary:(NSDictionary*)dic;
{
    
    NSLog(@"initWithDictionary");

    
    self.img_url = dic[@"image"];
    self.title_S =dic[@"description"];
    
    return self;
}
@end
