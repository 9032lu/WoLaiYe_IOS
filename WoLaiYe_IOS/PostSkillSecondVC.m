//
//  PostSkillSecondVC.m
//  WoLaiYe_IOS
//
//  Created by yugang on 16/6/7.
//  Copyright © 2016年 kzk. All rights reserved.
//

#import "PostSkillSecondVC.h"
#import "Header.h"
@interface PostSkillSecondVC ()
{
    SCREEN_WIDTH_AND_HEIGHT
    UIScrollView *big_scrollView;
    UIButton *oldbtn ;
    
}
@end

@implementation PostSkillSecondVC


-(void)backClick{
    POP
}
-(void)postClick{
    
    
    
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    SCREEN
    TOP_VIEW(@"发布技能")
    
    UIButton *right_btn =[[UIButton alloc]initWithFrame:CGRectMake(_width*0.8, 20, _width*0.2, 44)];
    [right_btn setTitle:@"发布" forState:UIControlStateNormal];
    right_btn.titleLabel.font = [UIFont boldSystemFontOfSize:17];
    [right_btn addTarget:self action:@selector(postClick) forControlEvents:UIControlEventTouchUpInside];
    
    [topView addSubview:right_btn];
    
    
    big_scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, _width, _height-64)];
    [self.view addSubview:big_scrollView];
    
    [self setupSubViews];
    [self.view bringSubviewToFront:topView];
    
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
        redView.layer.cornerRadius=3;
        redView.clipsToBounds = YES;
        [big_scrollView addSubview:redView];
        if (i !=2) {
            UIView *line = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(redView.frame), CGRectGetMidY(redView.frame), (_width-20)/3-6, 1)];
            line.backgroundColor =[UIColor darkGrayColor];
            [big_scrollView addSubview:line];
            
        }
        
    }
    
    
    NSArray *arr_four = @[@"线上",@"找我",@"上门",@"邮寄"];
    for (int i = 0; i < 4; i ++) {
        UIButton *four_btn = [[UIButton alloc]initWithFrame:CGRectMake(15+i*((_width-30-30)/4+10), 80, (_width-30-30)/4, _width*0.25)];
        four_btn.backgroundColor = [UIColor lightGrayColor];
        [big_scrollView addSubview:four_btn];
        four_btn.tag = i;
        [four_btn addTarget:self action:@selector(fourClick:) forControlEvents:UIControlEventTouchUpInside];
        
        if (i==0) {
            four_btn.backgroundColor = [UIColor orangeColor];
            oldbtn = four_btn;
        }
        
        UIImageView *img= [[UIImageView alloc]initWithFrame:CGRectMake((CGRectGetWidth(four_btn.frame)-_width*0.1)/2, 10, _width*0.1, _width*0.12)];
        
        img.backgroundColor =[UIColor whiteColor];
        [four_btn addSubview:img];
        
        UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(img.frame), CGRectGetWidth(four_btn.frame), CGRectGetHeight(four_btn.frame)-CGRectGetMaxY(img.frame))];
        lable.text = arr_four[i];
        lable.textColor = [UIColor whiteColor];
        lable.font = [UIFont systemFontOfSize:13];
        lable.textAlignment = NSTextAlignmentCenter;
        [four_btn addSubview:lable];
        
    }
    
    
    for (int i = 0; i < 3; i ++) {
        
        UIView *line0 = [[UIView alloc]initWithFrame:CGRectMake(0, 90+_width*0.25+35*i, _width, 1)];
        line0.backgroundColor = [UIColor lightGrayColor];
        [big_scrollView addSubview:line0];
        
        if (i!=2) {
            UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(line0.frame), _width, 35)];
            lable.textColor = [UIColor lightGrayColor];
            lable.font = [UIFont systemFontOfSize:13];
            lable.textAlignment = NSTextAlignmentLeft;
            [big_scrollView addSubview:lable];
            
            UIImageView *imageV = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetWidth(big_scrollView.frame)-15, CGRectGetMaxY(line0.frame)+10, 7.5, 15)];
            imageV.image =[UIImage  imageNamed:@"rightArrow"];
            [big_scrollView addSubview:imageV];
            
            UIButton *btn =[[UIButton alloc]initWithFrame:lable.frame];
            [btn addTarget:self action:@selector(choseClick:) forControlEvents:UIControlEventTouchUpInside];
            btn.tag = i;
            [big_scrollView addSubview:btn];
            
            
            if (i ==0) {
                lable.text = @"选择服务时间";

            }else{
                lable.text = @"选择服务范围";

            }
        }
       
        
    }
    

}

-(void)choseClick:(UIButton*)sender{
    NSLog(@"chose");
}

-(void)fourClick:(UIButton*)sender{
    
    if (oldbtn!=sender) {
        oldbtn.backgroundColor =[UIColor lightGrayColor];
        sender.backgroundColor =[UIColor orangeColor];
        oldbtn =sender;
    }
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
