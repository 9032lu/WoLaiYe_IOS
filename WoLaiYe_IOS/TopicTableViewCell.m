//
//  TopicTableViewCell.m
//  WoLaiYe_IOS
//
//  Created by yugang on 16/6/2.
//  Copyright © 2016年 kzk. All rights reserved.
//

#import "TopicTableViewCell.h"
#import "Header.h"
@implementation TopicTableViewCell




-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self) {
        self =  [super initWithStyle:style reuseIdentifier:reuseIdentifier];
        [self initSubViews];
    }
    
    
     return self;
}

-(void)initSubViews{
    
    CGFloat _width = [UIScreen mainScreen].bounds.size.width;
    
    UIImageView *img_V = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, _width, _width*0.5)];
    [self addSubview:img_V];
    self.back_Img = img_V;
    
    UIView *view_a = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_back_Img.frame)-30, _width, 30)];
    view_a.backgroundColor = [UIColor whiteColor];
    view_a.alpha = 0.5;
    [self addSubview:view_a];
    
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, CGRectGetMaxX(view_a.frame), 27)];
    lab.font = [UIFont systemFontOfSize:20];
    lab.textColor = [UIColor redColor];
    [view_a addSubview:lab];
    self.descrip_lab = lab;
    

}


-(void)setModel:(TopicModel *)model{
    _model = model;
    
    [self.back_Img sd_setImageWithURL:[NSURL URLWithString:_model.img_url] placeholderImage:nil];
    
    NSLog(@"=====%@",_model.img_url);
    self.descrip_lab.text = _model.title_S;
    
    
}

-(CGFloat)cellHeightWithModel:(TopicModel*)model{
    
    return CGRectGetMaxY(self.descrip_lab.frame)+10;
    
}


@end
