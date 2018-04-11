//
//  PostDemansVC.m
//  WoLaiYe_IOS
//
//  Created by yugang on 16/6/6.
//  Copyright © 2016年 kzk. All rights reserved.
//

#import "PostDemansVC.h"
#import "Header.h"
@interface PostDemansVC ()<UITextViewDelegate,UITextFieldDelegate,UIScrollViewDelegate>
{
    SCREEN_WIDTH_AND_HEIGHT
    UIScrollView *big_scrollView;
    UITextView *text_view;
}

@property(nonatomic,strong)UITextView *placeholderLabel;
@property(nonatomic,strong)UITextField *price_textFiled;

@end

@implementation PostDemansVC


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    
    //注册通知监听键盘的出现与消失
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
}


-(void)keyboardWillShow:(NSNotification*)aNotification{
    CGRect keyboardRect = [[[aNotification userInfo]objectForKey:UIKeyboardBoundsUserInfoKey]CGRectValue];
    
    //    NSTimeInterval animationDuration = [[[aNotification userInfo]objectForKey:UIKeyboardAnimationDurationUserInfoKey]doubleValue];
    
    CGFloat offset = keyboardRect.size.height- (_height-76 -CGRectGetMaxY(self.price_textFiled.frame));
    
    
    CGRect frame = big_scrollView.frame;
    frame.origin.y -= offset;
    
    if ([self.price_textFiled isFirstResponder]) {
        
        [UIView beginAnimations:@"ResizeForkeyboard" context:nil];
        [UIView setAnimationDuration:0.5];
        big_scrollView.frame= frame;
        [UIView commitAnimations];
        

    }
    
    
    
}


-(void)keyboardWillHide:(NSNotification*)aNotification{
    
    
    CGRect keyboardRect = [[[aNotification userInfo] objectForKey:UIKeyboardBoundsUserInfoKey] CGRectValue];
    
    //    NSTimeInterval animationDuartion = [[[aNotification userInfo]objectForKey:UIKeyboardAnimationDurationUserInfoKey]doubleValue];
    CGFloat offset = keyboardRect.size.height- (_height-76 -CGRectGetMaxY(self.price_textFiled.frame));
    
    CGRect frame = big_scrollView.frame;
    frame.origin.y += offset;
    
    if ([self.price_textFiled isFirstResponder]) {
        
        [UIView beginAnimations:@"ResizeForkeyboard" context:nil];
        
        [UIView setAnimationDuration:0.5];
        big_scrollView.frame= frame;
        [UIView commitAnimations];

        
        
    }

    
    
    
    
}


-(void)backClick{
    POP
}
-(void)postClick{
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    SCREEN
    TOP_VIEW(@"发布需求")
    
    UIButton *right_btn =[[UIButton alloc]initWithFrame:CGRectMake(_width*0.85, 20, _width*0.15, 44)];
    [right_btn setTitle:@"发布" forState:UIControlStateNormal];
    right_btn.titleLabel.font = [UIFont boldSystemFontOfSize:17];
    [right_btn addTarget:self action:@selector(postClick) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:right_btn];
    
    
    big_scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, _width, _height-64)];
    big_scrollView.delegate = self;
    [self.view addSubview:big_scrollView];
    
    [self setupSubviews];
    [self.view bringSubviewToFront:topView];
    

}

-(void)setupSubviews{
    //标题输入框
    UITextField *title_Fileld = [[UITextField alloc]initWithFrame:CGRectMake(2,0, _width-4, 40)];
    title_Fileld.placeholder = @"填写您的需求标题";
    title_Fileld.font = [UIFont systemFontOfSize:12];
    title_Fileld.textColor = [UIColor blackColor];
    //    [title_Fileld setValue:[UIColor redColor] forKeyPath:@"_placeholderLabel.textColor"];
    title_Fileld.delegate = self;
    [title_Fileld setValue:[UIFont systemFontOfSize:12] forKeyPath:@"_placeholderLabel.font"];
    [big_scrollView addSubview:title_Fileld];
    
    UIView *line0 = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(title_Fileld.frame), _width, 2)];
    line0.backgroundColor = [UIColor lightGrayColor];
    [big_scrollView addSubview:line0];
    
    //描述输入框
    
    _placeholderLabel = [[UITextView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(line0.frame), _width, 30)];
    _placeholderLabel.text = @"简单描述一下您的需求和要求......";
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

    UIView *line2 = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(big_img.frame)+15+_width*0.25, _width, 2)];
    line2.backgroundColor = [UIColor lightGrayColor];
    [big_scrollView addSubview:line2];

    
    NSArray *arr_B = @[@"定价求助",@"议价求助",@"找人帮忙"];
    for (int i = 0; i < 3; i ++) {
        UIButton *money_btn =[UIButton buttonWithType:UIButtonTypeCustom];
        money_btn.frame = CGRectMake(10+i*((_width-20-10)/3+5), CGRectGetMaxY(line2.frame)+5, (_width-20-10)/3, 30);
        [money_btn setTitle:arr_B[i] forState:UIControlStateNormal];
        money_btn.titleLabel.font = [UIFont boldSystemFontOfSize:13];
        [money_btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        money_btn.backgroundColor = [UIColor lightGrayColor];

        
        [big_scrollView addSubview:money_btn];
        if (i==0) {
            money_btn.backgroundColor = [UIColor orangeColor];

        }
    
    }
    
    _price_textFiled = [[UITextField alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(line2.frame)+40, (_width-40)/2, 30)];
    _price_textFiled.placeholder = @" 填写您给出的价格";
    _price_textFiled.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _price_textFiled.layer.borderWidth= 1;
    _price_textFiled.delegate = self;
    [_price_textFiled setValue:[UIFont systemFontOfSize:12] forKeyPath:@"_placeholderLabel.font"];
    _price_textFiled.font = [UIFont systemFontOfSize:13];
    [big_scrollView addSubview:_price_textFiled];
    
    
    UILabel *xiegang = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_price_textFiled.frame), CGRectGetMinY(_price_textFiled.frame), 20, 30)];
    xiegang.text = @"/";
    xiegang.font = [UIFont systemFontOfSize:20];
    xiegang.textAlignment = NSTextAlignmentCenter;
    [big_scrollView addSubview:xiegang];
    
    UIButton *unit_btn = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(xiegang.frame), CGRectGetMinY(xiegang.frame), (_width-40)/2, 30)];
    unit_btn.layer.borderWidth= 1;
    unit_btn.layer.borderColor= [UIColor lightGrayColor].CGColor;
    [unit_btn setTintColor:[UIColor redColor]];
    [unit_btn setTitle:@"  单位" forState:UIControlStateNormal];
    [unit_btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    unit_btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    unit_btn.titleLabel.font = [UIFont systemFontOfSize:13];
    [big_scrollView addSubview:unit_btn];
    
    
    UIButton *btn_time = [[UIButton alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(_price_textFiled.frame)+30, _width*0.3, 30)];
    btn_time.titleLabel.font = [UIFont systemFontOfSize:13];
    [btn_time setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [btn_time setTitle:@"选择截止时间:" forState:UIControlStateNormal
     ];
    [btn_time addTarget:self action:@selector(selectTime) forControlEvents:UIControlEventTouchUpInside];
    btn_time.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [big_scrollView addSubview:btn_time];
    
    CGSize size = [btn_time.titleLabel.text boundingRectWithSize:CGSizeMake(MAXFLOAT, 30) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13]} context:nil].size;
    
    UILabel *end_time = [[UILabel alloc]initWithFrame:CGRectMake(10+size.width+5, CGRectGetMinY(btn_time.frame), _width-25-size.width, 30)];
    end_time.backgroundColor =[UIColor lightGrayColor];
    end_time.text = @"21312";
    end_time.textColor = [UIColor blackColor];
    end_time.font = [UIFont systemFontOfSize:13];
    [big_scrollView addSubview:end_time];
    
    
    
    big_scrollView.contentSize = CGSizeMake(_width, CGRectGetMaxY(end_time.frame)+30);

}


-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    [text_view resignFirstResponder];
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
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

-(void)selectTime{
    NSLog(@"选择时间");
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
