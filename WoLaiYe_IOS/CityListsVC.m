//
//  CityListsVC.m
//  WoLaiYe_IOS
//
//  Created by 鲁征东 on 16/7/6.
//  Copyright © 2016年 kzk. All rights reserved.
//

#import "CityListsVC.h"

@interface CityListsVC ()
{
    
}
@end

@implementation CityListsVC


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    self.tabBarController.tabBar.hidden = YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
//    SCREEN
//    TOP_VIEW(@"城市列表")



}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
