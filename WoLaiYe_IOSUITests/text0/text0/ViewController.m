//
//  ViewController.m
//  text0
//
//  Created by yugang on 16/5/30.
//  Copyright © 2016年 lzd. All rights reserved.
//

#import "ViewController.h"
#import "redViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *red = [[UIButton alloc]initWithFrame:CGRectMake(10, 10, 20, 20)];
    red.backgroundColor =[UIColor redColor];
    [self.view addSubview: red];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
