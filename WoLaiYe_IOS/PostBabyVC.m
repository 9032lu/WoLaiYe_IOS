//
//  PostBabyVC.m
//  WoLaiYe_IOS
//
//  Created by yugang on 16/6/6.
//  Copyright © 2016年 kzk. All rights reserved.
//

#import "PostBabyVC.h"
#import "Header.h"

@interface PostBabyVC ()<UITextViewDelegate>
{
    SCREEN_WIDTH_AND_HEIGHT
    
    UIScrollView *big_scrollView;
    UITextView *text_view;
}

@property(nonatomic,strong)UITextView *placeholderLabel;

@end

@implementation PostBabyVC

-(void)backClick{
    POP
}
-(void)postClick{
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    SCREEN
    TOP_VIEW(@"发布宝贝")
    UIButton *right_btn =[[UIButton alloc]initWithFrame:CGRectMake(_width*0.85, 20, _width*0.15, 44)];
    [right_btn setTitle:@"发布" forState:UIControlStateNormal];
    right_btn.titleLabel.font = [UIFont boldSystemFontOfSize:17];
    [right_btn addTarget:self action:@selector(postClick) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:right_btn];
    
    big_scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, _width, _height-64)];
    [self.view addSubview:big_scrollView];
    
    UILabel *_lab = [[UILabel alloc]initWithFrame:CGRectMake(5, 15, _width, 30)];
    _lab.text = @"选择宝贝分类:";
    _lab.font = [UIFont systemFontOfSize:12];
    _lab.textColor = [UIColor lightGrayColor];
    [big_scrollView addSubview:_lab];
    
    CGSize size =  [_lab.text boundingRectWithSize:CGSizeMake(MAXFLOAT, 30) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]} context:nil].size;
   
    
    UILabel*sort =[[UILabel alloc]initWithFrame:CGRectMake(5+size.width+5, 15, _width-15-size.width, 30)];
    sort.backgroundColor = [UIColor lightGrayColor];
    sort.font = [UIFont systemFontOfSize:12];
    sort.textColor = [UIColor blackColor];
    sort.text = @"  时代大厦";
    [big_scrollView addSubview:sort];
    
    UIButton *xialaBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    xialaBtn.frame = CGRectMake(_width-55, 15, 50, 30);
    [xialaBtn addTarget:self action:@selector(xialaClick) forControlEvents:UIControlEventTouchUpInside];
    [big_scrollView addSubview:xialaBtn];
    
    UIImageView *xia_img =[[UIImageView alloc]initWithFrame:CGRectMake(50-35, (30-15)/2, 15, 15)];
    xia_img.image = [UIImage imageNamed:@"xiaosanjiaodown"];
    [xialaBtn addSubview:xia_img];
    
    //标题输入框
    UITextField *title_Fileld = [[UITextField alloc]initWithFrame:CGRectMake(2, CGRectGetMaxY(sort.frame)+3, _width-4, 30)];
    title_Fileld.placeholder = @"给你的宝贝起个标题吧";
    title_Fileld.font = [UIFont systemFontOfSize:12];
    title_Fileld.textColor = [UIColor blackColor];
//    [title_Fileld setValue:[UIColor redColor] forKeyPath:@"_placeholderLabel.textColor"];
    [title_Fileld setValue:[UIFont systemFontOfSize:12] forKeyPath:@"_placeholderLabel.font"];
    [big_scrollView addSubview:title_Fileld];
    
    UIView *line0 = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(title_Fileld.frame), _width, 2)];
    line0.backgroundColor = [UIColor lightGrayColor];
    [big_scrollView addSubview:line0];
    
    //描述输入框
    
    _placeholderLabel = [[UITextView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(line0.frame), _width, 30)];
    _placeholderLabel.text = @"描述一下您的宝贝吧......";
    _placeholderLabel.textColor = [UIColor lightGrayColor];
    [_placeholderLabel setEditable:NO];
    [big_scrollView addSubview:_placeholderLabel];
    
 
     text_view =[[UITextView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(line0.frame), _width, _width*0.2)];
    text_view.font = [UIFont systemFontOfSize:13];
    text_view.backgroundColor=[UIColor clearColor];
    text_view.delegate = self;
    
    [big_scrollView addSubview:text_view];
    
    UIView *line1 = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(text_view.frame), _width, 2)];
    line1.backgroundColor = [UIColor lightGrayColor];
    [big_scrollView addSubview:line1];
    
    UIImageView *big_img =[[UIImageView alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(line1.frame)+5, _width-20, _width*0.5)];
    big_img.backgroundColor =[UIColor redColor];
    [big_scrollView addSubview:big_img];
    
    
    
    UILabel *fengmian_lab =[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 50, 20)];
    fengmian_lab.backgroundColor = [UIColor orangeColor];
    fengmian_lab.textColor =[UIColor whiteColor];
    fengmian_lab.text = @"封面";
    fengmian_lab.textAlignment = NSTextAlignmentCenter;
    fengmian_lab.font = [UIFont systemFontOfSize:11];
    [big_img addSubview:fengmian_lab];
    
    
    for (int i = 0; i < 3; i ++) {
        UIImageView *third_img = [[UIImageView alloc]initWithFrame:CGRectMake(10+i*((_width-20-10)/3+5), CGRectGetMaxY(big_img.frame)+5, (_width-20-10)/3, _width*0.25)];
        third_img.backgroundColor = [UIColor redColor];
        [big_scrollView addSubview:third_img];
        
    }
    
    
    UIButton *price =[UIButton buttonWithType:UIButtonTypeCustom];
    price.frame = CGRectMake(10, CGRectGetMaxY(big_img.frame)+15+_width*0.25, (_width-20-10)/3-10, 30);
    [price setTitle:@"价格" forState:UIControlStateNormal];
    [price setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    price.layer.borderColor = [UIColor lightGrayColor].CGColor;
    price.layer.borderWidth = 1;
    price.titleLabel.font = [UIFont systemFontOfSize:14];
    [big_scrollView addSubview:price];
    
    UILabel *xiegang = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(price.frame), CGRectGetMinY(price.frame), 20, 30)];
    xiegang.text = @"/";
    xiegang.font = [UIFont systemFontOfSize:20];
    xiegang.textAlignment = NSTextAlignmentCenter;
    [big_scrollView addSubview:xiegang];
    
    
    UIButton *unit_btn =[UIButton buttonWithType:UIButtonTypeCustom];
    unit_btn.frame = CGRectMake(CGRectGetMaxX(xiegang.frame), CGRectGetMinY(xiegang.frame), (_width-20-10)/3-10, 30);
    [unit_btn setTitle:@"单位" forState:UIControlStateNormal];
    [unit_btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    unit_btn.layer.borderColor = [UIColor lightGrayColor].CGColor;
    unit_btn.layer.borderWidth = 1;
    unit_btn.titleLabel.font = [UIFont systemFontOfSize:14];
    [big_scrollView addSubview:unit_btn];
    
    
    UIButton *count_btn =[UIButton buttonWithType:UIButtonTypeCustom];
    count_btn.frame = CGRectMake(CGRectGetMaxX(unit_btn.frame)+10, CGRectGetMinY(unit_btn.frame), (_width-20-10)/3-10, 30);
    [count_btn setTitle:@"库存" forState:UIControlStateNormal];
    [count_btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    count_btn.layer.borderColor = [UIColor lightGrayColor].CGColor;
    count_btn.layer.borderWidth = 1;
    count_btn.titleLabel.font = [UIFont systemFontOfSize:14];
    [big_scrollView addSubview:count_btn];
    
    
    big_scrollView.contentSize= CGSizeMake(_width, CGRectGetMaxY(count_btn.frame));

}

-(void)xialaClick{
    NSLog(@"下拉");
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [text_view resignFirstResponder];
}
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text

{    if (![text isEqualToString:@""])
    
{
    
    _placeholderLabel.hidden = YES;
    
}
    
    if ([text isEqualToString:@""] && range.location == 0 && range.length == 1)
        
    {
        
        _placeholderLabel.hidden = NO;
        
    }
    
    return YES;
    
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
