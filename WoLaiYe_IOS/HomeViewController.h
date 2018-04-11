//
//  HomeViewController.h
//  WoLaiYe_IOS
//
//  Created by yugang on 16/6/1.
//  Copyright © 2016年 kzk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *table_view;
@property(nonatomic,strong)    NSMutableArray *sort_Arr;
@property(nonatomic,strong) NSArray *data_Array;
@property(nonatomic,strong)NSDictionary *header_dic;

//@property(nonatomic,strong)NSDictionary *buttons_dic;



@property(nonatomic,strong)UIImageView *back_Img;
@property(nonatomic,strong)UILabel *descrip_lab;

@end
