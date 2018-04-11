//
//  TopicModel.h
//  WoLaiYe_IOS
//
//  Created by 鲁征东 on 16/6/15.
//  Copyright © 2016年 kzk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TopicModel : NSObject
@property(nonatomic,copy)NSString *img_url; //图片
@property(nonatomic,copy)NSString *title_S;//主题


@property(nonatomic,assign) CGFloat cellHeight;//cell的高度


-(TopicModel*)initWithDictionary:(NSDictionary*)dic;

@end
