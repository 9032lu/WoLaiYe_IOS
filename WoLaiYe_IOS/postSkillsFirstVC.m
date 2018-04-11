//
//  postSkillsFirstVC.m
//  WoLaiYe_IOS
//
//  Created by yugang on 16/6/7.
//  Copyright © 2016年 kzk. All rights reserved.
//

#import "postSkillsFirstVC.h"
#import "Header.h"
#import <CommonCrypto/CommonDigest.h>
#import "PostSkillSecondVC.h"

@interface postSkillsFirstVC ()<UIScrollViewDelegate,UITextFieldDelegate,UITextViewDelegate>
{
    SCREEN_WIDTH_AND_HEIGHT
    UIScrollView *big_scrollView;
    
    UITextView *text_view;
}
@property(nonatomic,strong)UITextField *price_textFiled;
@property(nonatomic,strong)UITextField *address_textFiled;

@property(nonatomic,strong)UITextView *placeholderLabel;

@end

@implementation postSkillsFirstVC


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    
    //注册通知监听键盘的出现与消失
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
}


-(void)keyboardWillShow:(NSNotification*)aNotification{
    CGRect keyboardRect = [[[aNotification userInfo]objectForKey:UIKeyboardBoundsUserInfoKey]CGRectValue];
    
    //    NSTimeInterval animationDuration = [[[aNotification userInfo]objectForKey:UIKeyboardAnimationDurationUserInfoKey]doubleValue];
    
    if ([self.price_textFiled isFirstResponder]||[self.address_textFiled isFirstResponder]) {
        CGFloat offset = keyboardRect.size.height- (_height-76 -CGRectGetMaxY(self.price_textFiled.frame));
        
        
        CGRect frame = big_scrollView.frame;
        frame.origin.y -= offset;
        
        if (big_scrollView.frame.origin.y<0) {
            
        }else{
            [UIView beginAnimations:@"ResizeForkeyboard" context:nil];
            [UIView setAnimationDuration:0.5];
            big_scrollView.frame= frame;
            [UIView commitAnimations];

        }
        
        
    }
    
    
    
    
    
}


-(void)keyboardWillHide:(NSNotification*)aNotification{
    
    
    CGRect keyboardRect = [[[aNotification userInfo] objectForKey:UIKeyboardBoundsUserInfoKey] CGRectValue];
    
    //    NSTimeInterval animationDuartion = [[[aNotification userInfo]objectForKey:UIKeyboardAnimationDurationUserInfoKey]doubleValue];
    
    if ([self.price_textFiled isFirstResponder]|[self.address_textFiled isFirstResponder]) {
        CGFloat offset = keyboardRect.size.height- (_height-76 -CGRectGetMaxY(self.price_textFiled.frame));
        
        CGRect frame = big_scrollView.frame;
        frame.origin.y += offset;

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
    
    
    PUSH(PostSkillSecondVC)
    
    
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
    [self.view bringSubviewToFront:topView];
    
//    NSString *md5S = [self md5:@"112233"];
//    NSLog(@"=====%@",md5S);
    
    
    
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
            
        }else{
            redView.backgroundColor =[UIColor lightGrayColor];

        }
        
    }
    
    //标题输入框
    UITextField *title_Fileld = [[UITextField alloc]initWithFrame:CGRectMake(2,80, _width-4, 40)];
    title_Fileld.placeholder = @"给您的服务起一个好听的标题";
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
    _placeholderLabel.text = @"简单描述一下您的服务......";
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
    
//    UIView *line2 = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(big_img.frame)+15+_width*0.25, _width, 2)];
//    line2.backgroundColor = [UIColor lightGrayColor];
//    [big_scrollView addSubview:line2];
//    
    
    
    _price_textFiled = [[UITextField alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(big_img.frame)+15+_width*0.25, (_width-40)/2, 30)];
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
    
    _address_textFiled = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(xiegang.frame), CGRectGetMinY(xiegang.frame), (_width-40)/2, 30)];
    _address_textFiled.placeholder = @" 填写您服务的单位";
    [_address_textFiled setValue:[UIFont systemFontOfSize:12] forKeyPath:@"_placeholderLabel.font"];
    _address_textFiled.font = [UIFont systemFontOfSize:13];
    _address_textFiled.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _address_textFiled.layer.borderWidth= 1;
    _address_textFiled.delegate = self;

    [big_scrollView addSubview:_address_textFiled];

    big_scrollView.contentSize =CGSizeMake(_width, CGRectGetMaxY(_address_textFiled.frame)+30);
    
}


-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    [text_view resignFirstResponder];
    [self.price_textFiled resignFirstResponder];
    [self.address_textFiled resignFirstResponder];

}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.price_textFiled resignFirstResponder];
    [self.address_textFiled resignFirstResponder];
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


//-(NSString *)md5:(NSString *)str
//{
//    const char *cStr = [str UTF8String];
//    unsigned char result[CC_MD5_DIGEST_LENGTH];
//    NSNumber *num = [NSNumber numberWithUnsignedLong:strlen(cStr)];
//    CC_MD5( cStr,[num intValue], result ); // This is the md5 call
//    
//    
//    return [NSString stringWithFormat:
//            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
//            result[0], result[1], result[2], result[3],
//            result[4], result[5], result[6], result[7],
//            result[8], result[9], result[10], result[11],
//            result[12], result[13], result[14], result[15]
//            ];
//}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
