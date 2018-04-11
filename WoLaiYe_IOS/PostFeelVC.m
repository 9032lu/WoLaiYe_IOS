//
//  PostFeelVC.m
//  WoLaiYe_IOS
//
//  Created by yugang on 16/6/6.
//  Copyright © 2016年 kzk. All rights reserved.
//

#import "PostFeelVC.h"
#import "Header.h"
@interface PostFeelVC ()<UITextViewDelegate>
{
    SCREEN_WIDTH_AND_HEIGHT
    UIScrollView *big_scrollView ;
}

@property(nonatomic,strong)UITextView *textView;
@property(nonatomic,strong)UITextView *placeholderLabel;

@end

@implementation PostFeelVC

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    
    //注册通知监听键盘的出现与消失
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];

}


-(void)keyboardWillShow:(NSNotification*)aNotification{
    CGRect keyboardRect = [[[aNotification userInfo]objectForKey:UIKeyboardBoundsUserInfoKey]CGRectValue];
    
//    NSTimeInterval animationDuration = [[[aNotification userInfo]objectForKey:UIKeyboardAnimationDurationUserInfoKey]doubleValue];
    
    CGFloat offset = keyboardRect.size.height- (_height-76 -CGRectGetMaxY(self.textView.frame));

    
        CGRect frame = big_scrollView.frame;
        frame.origin.y -= offset;
        
        [UIView beginAnimations:@"ResizeForkeyboard" context:nil];
        [UIView setAnimationDuration:0.5];
        big_scrollView.frame= frame;
        [UIView commitAnimations];
        

    
}


-(void)keyboardWillHide:(NSNotification*)aNotification{
    
    
     CGRect keyboardRect = [[[aNotification userInfo] objectForKey:UIKeyboardBoundsUserInfoKey] CGRectValue];
    
//    NSTimeInterval animationDuartion = [[[aNotification userInfo]objectForKey:UIKeyboardAnimationDurationUserInfoKey]doubleValue];
    CGFloat offset = keyboardRect.size.height- (_height-76 -CGRectGetMaxY(self.textView.frame));
    
        CGRect frame = big_scrollView.frame;
        frame.origin.y += offset;
        
        [UIView beginAnimations:@"ResizeForkeyboard" context:nil];
    
        [UIView setAnimationDuration:0.5];
        big_scrollView.frame= frame;
        [UIView commitAnimations];

    
    
}
-(void)backClick{
    POP
}
- (void)viewDidLoad {
    [super viewDidLoad];
    SCREEN
    TOP_VIEW(@"发布心情")
    UIButton *right_btn =[[UIButton alloc]initWithFrame:CGRectMake(_width*0.85, 20, _width*0.15, 44)];
    [right_btn setTitle:@"发布" forState:UIControlStateNormal];
    right_btn.titleLabel.font = [UIFont boldSystemFontOfSize:17];
    [right_btn addTarget:self action:@selector(postClick) forControlEvents:UIControlEventTouchUpInside];
    
    [topView addSubview:right_btn];


     big_scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, _width, _height-64)];
    [self.view addSubview:big_scrollView];
    
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(5, 2, _width-10, _width*0.7)];
    imageView.backgroundColor = [UIColor darkGrayColor];
    imageView.userInteractionEnabled = YES;
    [big_scrollView addSubview:imageView];
    
    UITapGestureRecognizer *singleRecongnizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(singleTap)];
    singleRecongnizer.numberOfTapsRequired = 1;
    [imageView addGestureRecognizer:singleRecongnizer];
    
    _placeholderLabel = [[UITextView alloc]initWithFrame:CGRectMake(5, CGRectGetMaxY(imageView.frame)+10, CGRectGetWidth(imageView.frame), 30)];
    _placeholderLabel.text = @"在这一刻我想说......";
    _placeholderLabel.textColor = [UIColor lightGrayColor];
    [_placeholderLabel setEditable:NO];
    [big_scrollView addSubview:_placeholderLabel];
    
    
    UITextView *textView =[[UITextView alloc]initWithFrame:CGRectMake(5, CGRectGetMaxY(imageView.frame)+10, CGRectGetWidth(imageView.frame), _width*0.3)];
    textView.delegate = self;
    textView.layer.borderColor= APP_ClOUR.CGColor;
    textView.layer.borderWidth= 1;
    textView.backgroundColor =[UIColor clearColor];
    [big_scrollView addSubview:textView];
    self.textView = textView;
    
    
    [self.view bringSubviewToFront:topView];
    
}


-(void)singleTap{
    [_textView resignFirstResponder];
    NSLog(@"添加图片");
}
-(void)postClick{
    NSLog(@"发布心情");
}

-(void)textViewDidChange:(UITextView *)textView

{
    
    //    textview 改变字体的行间距
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    
    paragraphStyle.lineSpacing = 3;// 字体的行间距
    
    
    NSDictionary *attributes = @{
                                 
                                 NSFontAttributeName:[UIFont systemFontOfSize:15],
                                 
                                 NSParagraphStyleAttributeName:paragraphStyle
                                 
                                 };
    
    textView.attributedText = [[NSAttributedString alloc] initWithString:textView.text attributes:attributes];
    
    
    
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


@end
