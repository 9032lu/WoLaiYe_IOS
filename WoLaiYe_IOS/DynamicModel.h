//
//  DynamicModel.h
//  WoLaiYe_IOS
//
//  Created by 鲁征东 on 16/6/14.
//  Copyright © 2016年 kzk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DynamicModel : NSObject
@property(nonatomic,copy)NSString *topic_img; //图片
@property(nonatomic,copy)NSString *title_str; //主题
@property(nonatomic,copy)NSString *content_str; //内容


@property(nonatomic,assign)CGFloat cellHight; //cell的高度;
@end
