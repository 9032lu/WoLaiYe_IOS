//
//  PostSkillsVC.m
//  WoLaiYe_IOS
//
//  Created by yugang on 16/6/6.
//  Copyright © 2016年 kzk. All rights reserved.
//

#import "PostSkillsVC.h"
#import "Header.h"
#import "postSkillsFirstVC.h"

@interface PostSkillsVC ()<UIScrollViewDelegate>
{
    SCREEN_WIDTH_AND_HEIGHT
    UIScrollView *big_scrollView;
    UIButton *oldBtn;

}
@end

@implementation PostSkillsVC

-(void)backClick{
    POP
}
-(void)postClick{
    
    PUSH(postSkillsFirstVC)
}
- (void)viewDidLoad {
    [super viewDidLoad];
    SCREEN
    TOP_VIEW(@"发布技能")
    
    UIButton *right_btn =[[UIButton alloc]initWithFrame:CGRectMake(_width*0.8, 20, _width*0.2, 44)];
    [right_btn setTitle:@"下一步" forState:UIControlStateNormal];
    right_btn.titleLabel.font = [UIFont boldSystemFontOfSize:17];
    [right_btn addTarget:self action:@selector(postClick) forControlEvents:UIControlEventTouchUpInside];
    
    [topView addSubview:right_btn];
    
    
    big_scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, _width, _height-64)];
    [self.view addSubview:big_scrollView];
    
    [self setupSubViews];

    
}

-(void)setupSubViews{
    
    NSArray *arr = @[@"职业类别",@"服务内容",@"服务方式"];
    for (int i = 0; i < 3; i ++) {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake((_width-20)/3*i+10, 40, (_width-20)/3, 30)];
        
        label.text = arr[i];
        label.textColor = [UIColor lightGrayColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:13];
        [big_scrollView addSubview:label];
        
        UIView *redView = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetMidX(label.frame), CGRectGetMinY(label.frame)-10, 6, 6)];
        redView.backgroundColor =[UIColor redColor];
        if (i!=0) {
            redView.backgroundColor =[UIColor lightGrayColor];

        }
        redView.layer.cornerRadius=3;
        redView.clipsToBounds = YES;
        [big_scrollView addSubview:redView];
        if (i !=2) {
            UIView *line = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(redView.frame), CGRectGetMidY(redView.frame), (_width-20)/3-6, 1)];
            line.backgroundColor =[UIColor darkGrayColor];
            [big_scrollView addSubview:line];
            
        }
        

        
    }
    
    
    UIButton *last_btn ;
    for (int i = 0; i <5; i ++) {
        UIButton *button =[UIButton buttonWithType:UIButtonTypeCustom];
        last_btn = button;
        button.frame = CGRectMake(0, 90+80*i, _width, 70);
        button.backgroundColor = APP_ClOUR;
        [big_scrollView addSubview:button];
        
        if (i==0) {
            button.backgroundColor = [UIColor orangeColor];
            oldBtn = button;
        }
        button.tag = i;
        [button addTarget:self action:@selector(selectClick:) forControlEvents:UIControlEventTouchUpInside];
        
        
        
        
        UIImageView *imgV = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 30, 30)];
        imgV.backgroundColor=[UIColor whiteColor];
        [button addSubview:imgV];
        UILabel *lab_B = [[UILabel alloc]initWithFrame:CGRectMake(0, 40, 50, 30)];
        lab_B.text = @"营销师";
        lab_B.textColor = [UIColor whiteColor];
        lab_B.textAlignment = NSTextAlignmentCenter;
        lab_B.font = [UIFont systemFontOfSize:10];
        [button addSubview:lab_B];
        
        
        
        
        UIView *shuxin_line = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(imgV.frame)+15, 15, 2, 40)];
        shuxin_line.backgroundColor = [UIColor whiteColor];
        [button addSubview:shuxin_line];
        
        
        
        for (int j  = 0; j < 8; j ++) {
            int X = j%4;
            int Y = j/4;
            UILabel *sub_lab = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(shuxin_line.frame)+((CGRectGetWidth(button.frame)-CGRectGetMaxX(shuxin_line.frame))/4)*X, Y*25 +10, (CGRectGetWidth(button.frame)-CGRectGetMaxX(shuxin_line.frame))/4, 25)];
            sub_lab.textAlignment= NSTextAlignmentCenter;
            sub_lab.textColor =[UIColor whiteColor];
            sub_lab.text = @"网络营销";
            sub_lab.font = [UIFont systemFontOfSize:10];
            [button addSubview:sub_lab];
            
        }
    }
    
    big_scrollView.contentSize = CGSizeMake(_width, CGRectGetMaxY(last_btn.frame)+30);
    
   
    
    
}

-(void)selectClick:(UIButton*)sender{
    
    if (oldBtn!=sender) {
        sender.backgroundColor = [UIColor orangeColor];
        oldBtn.backgroundColor = APP_ClOUR;
        oldBtn = sender;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
