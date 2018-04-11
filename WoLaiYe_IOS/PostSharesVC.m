//
//  PostSharesVC.m
//  WoLaiYe_IOS
//
//  Created by yugang on 16/6/6.
//  Copyright © 2016年 kzk. All rights reserved.
//

#import "PostSharesVC.h"
#import "Header.h"

@interface PostSharesVC ()<UITextViewDelegate,UITextFieldDelegate,UIScrollViewDelegate>
{
    SCREEN_WIDTH_AND_HEIGHT

    
    UIScrollView *big_scrollView;
    UITextView *text_view;
}

@property(nonatomic,strong)UITextView *placeholderLabel;

@end

@implementation PostSharesVC

-(void)backClick{
    POP
}
- (void)viewDidLoad {
    [super viewDidLoad];
    SCREEN
    TOP_VIEW(@"发布分享")
    
    big_scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, _width, _height-64)];
    big_scrollView.delegate = self;
    [self.view addSubview:big_scrollView];
    
    [self setupSubviews];


    
}


-(void)setupSubviews{
    
    //标题输入框
    UITextField *title_Fileld = [[UITextField alloc]initWithFrame:CGRectMake(2,0, _width-4, 30)];
    title_Fileld.placeholder = @"给您的分享起个吸引人的标题吧";
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
    _placeholderLabel.text = @"简单描述一下您的这次分享......";
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
    
    UIView *line2 = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(big_img.frame)+10, _width, 2)];
    line2.backgroundColor = [UIColor lightGrayColor];
    [big_scrollView addSubview:line2];
    
    NSArray *arr_B = @[@"免费分享",@"收费分享",@"价格/元"];
    //收费
    for (int i = 0; i < 3; i ++) {
        UIButton *money_btn =[UIButton buttonWithType:UIButtonTypeCustom];
        money_btn.frame = CGRectMake(10+i*((_width-20-10)/3+5), CGRectGetMaxY(line2.frame)+5, (_width-20-10)/3, 30);
        [money_btn setTitle:arr_B[i] forState:UIControlStateNormal];
        money_btn.titleLabel.font = [UIFont boldSystemFontOfSize:13];
        [money_btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        [big_scrollView addSubview:money_btn];
        if (i==0) {
            money_btn.backgroundColor = [UIColor lightGrayColor];
            
        }else if (i==1){
            money_btn.backgroundColor = [UIColor orangeColor];
            
        }else{
            [money_btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
            money_btn.layer.borderWidth = 1;
            money_btn.layer.borderColor = [UIColor lightGrayColor].CGColor;
        }
    }
    
    UILabel *sucaiku =[[UILabel alloc]initWithFrame:CGRectMake(2, CGRectGetMaxY(line2.frame)+35+10, _width-4, 30)];
    sucaiku.text = @"素材库:请选择您要分享的素材库";
    sucaiku.textColor = [UIColor darkGrayColor];
    sucaiku.font = [UIFont systemFontOfSize:14];
    [big_scrollView addSubview:sucaiku];
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:sucaiku.text];
    [attributedString beginEditing];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:9] range:NSMakeRange(4, sucaiku.text.length-4)];
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor lightGrayColor] range:NSMakeRange(4, sucaiku.text.length-4)];
    sucaiku.attributedText = attributedString;
    
    
    UIView *line3 = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(sucaiku.frame)+5, _width, 2)];
    line3.backgroundColor = [UIColor lightGrayColor];
    [big_scrollView addSubview:line3];
    
    
    UIButton *last_bt;
    for (int i= 0; i < 7; i ++) {
        int X = i %4;
        int Y = i /4;
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(5 + ((_width-40)/4+10)*X, CGRectGetMaxY(line3.frame)+10 +(_width*0.3+5)*Y, (_width-40)/4, _width*0.27);
        button.backgroundColor = APP_ClOUR;
        button.tag = i;
        [button addTarget:self action:@selector(creatnewSucai:) forControlEvents:UIControlEventTouchUpInside];
        
        [big_scrollView addSubview:button];
        last_bt = button;
        
        if (i ==0) {
            UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(15, 15, CGRectGetWidth(button.frame)-30,CGRectGetWidth(button.frame)-30)];
            imageView.backgroundColor= [UIColor whiteColor];
            [button addSubview:imageView];
            UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(imageView.frame), CGRectGetWidth(button.frame), CGRectGetHeight(button.frame)-CGRectGetMaxY(imageView.frame))];
            lab.text = @"新建素材库";
            lab.textColor = [UIColor whiteColor];
            lab.textAlignment = NSTextAlignmentCenter;
            lab.font = [UIFont systemFontOfSize:11];
            [button addSubview:lab];
            
        }
    }

    
    big_scrollView.contentSize = CGSizeMake(_width, CGRectGetMaxY(last_bt.frame)+20);
    
    
   
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

-(void)creatnewSucai:(UIButton*)sender{
    NSLog(@"新建素菜");
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
