//
//  CollectModel.h
//  WoLaiYe_IOS
//
//  Created by yugang on 16/6/6.
//  Copyright © 2016年 kzk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectModel : NSObject


@property (nonatomic,copy) NSString *icon; //图片
@property (nonatomic,copy) NSString *content; //内容的label
//单元格的高度
@property(nonatomic,assign)CGFloat cellHeight;

@end
