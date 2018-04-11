//
//  ConversationListController.h
//  WoLaiYe_IOS
//
//  Created by 鲁征东 on 16/6/12.
//  Copyright © 2016年 kzk. All rights reserved.
//

#import "EaseConversationListViewController.h"

@interface ConversationListController : EaseConversationListViewController

@property (strong, nonatomic) NSMutableArray *conversationsArray;

- (void)refresh;
- (void)refreshDataSource;

- (void)isConnect:(BOOL)isConnect;
- (void)networkChanged:(EMConnectionState)connectionState;

@end
